class JobsController < ApplicationController
  
  def new
    @job = Job.new(:endtime => 1.hour.from_now, :period => "Does not repeat")
    render :json => {:form => render_to_string(:partial => 'form')}
  end
  
  def create
    if params[:job][:period] == "Does not repeat"
      job = Job.new(job_params)
    else
      #      @event_series = EventSeries.new(:frequency => params[:event][:frequency], :period => params[:event][:repeats], :starttime => params[:event][:starttime], :endtime => params[:event][:endtime], :all_day => params[:event][:all_day])
      job = JobSeries.new(job_params)
    end
    if job.save
      render :nothing => true
    else
      render :text => job.errors.full_messages.to_sentence, :status => 422
    end
  end
  
  def index
    
  end
  
  
  def get_jobs
    @jobs = Job.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}'"] )
    jobs = [] 
    @jobs.each do |job|
      jobs << {:id => job.id, :title => job.title, :description => job.description || "Some cool description here...", :start => "#{job.starttime.iso8601}", :end => "#{job.endtime.iso8601}", :allDay => job.all_day, :recurring => (job.job_series_id)? true: false}
    end
    render :text => jobs.to_json
  end
  
    
  def move
    @job = Job.find_by_id params[:id]
    if @job
      @job.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@job.starttime))
      @job.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@job.endtime))
      @job.all_day = params[:all_day]
      @job.save
    end
    render :nothing => true
  end
  
  
  def resize
    @job = Job.find_by_id params[:id]
    if @job
      @job.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@job.endtime))
      @job.save
    end    
    render :nothing => true
  end
  
  def edit
    @job = Job.find_by_id(params[:id])
    render :json => { :form => render_to_string(:partial => 'edit_form') } 
  end
  
  def update
    @job = Job.find_by_id(params[:job][:id])
    if params[:job][:commit_button] == "Update All Occurrence"
      @jobs = @job.job_series.jobs #.find(:all, :conditions => ["starttime > '#{@job.starttime.to_formatted_s(:db)}' "])
      @job.update_jobs(@jobs, job_params)
    elsif params[:job][:commit_button] == "Update All Following Occurrence"
      @jobs = @job.job_series.jobs.find(:all, :conditions => ["starttime > '#{@job.starttime.to_formatted_s(:db)}' "])
      @job.update_jobs(@jobs, job_params)
    else
      @job.attributes = job_params
      @job.save
    end
    render :nothing => true    
  end  
  
  def destroy
    @job = Job.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @job.job_series.destroy
    elsif params[:delete_all] == 'future'
      @jobs = @job.job_series.jobs.find(:all, :conditions => ["starttime > '#{@job.starttime.to_formatted_s(:db)}' "])
      @job.job_series.jobs.delete(@jobs)
    else
      @job.destroy
    end
    render :nothing => true   
  end

  private
    def job_params
      params.require(:job).permit('title', 'description', 'starttime(1i)', 'starttime(2i)', 'starttime(3i)', 'starttime(4i)', 'starttime(5i)', 'endtime(1i)', 'endtime(2i)', 'endtime(3i)', 'endtime(4i)', 'endtime(5i)', 'all_day', 'period', 'frequency', 'commit_button')
    end
  
end
