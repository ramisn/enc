class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @candidates = Candidate.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @candidate = Candidate.find(params[:id])

  end

  # GET /events/new
  def new
    @candidate = Candidate.new
  end

  # GET /events/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @candidate }
      else
        format.html { render action: 'new' }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end

  def download_cv
    cv = Candidate.find(params[:id]).cv
    send_file "#{Rails.root}/public/#{cv}"
  end

  # def search
  #   if params[:search].blank?
  #     @candidates = Candidate.all
  #   else
  #     #@events = Event.search(params[:event][:search])
  #     #@events = Event.where(params[:event][:search])
  #     @candidates = Candidate.where(["category_id=?", params[:search]])
  #   end
  #   render :layout => false
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :gender, :dob, :education, :website, :address, :address1, :city, :state, :zip, :home_phone, :mobile, :language, :cv)
    end
end

