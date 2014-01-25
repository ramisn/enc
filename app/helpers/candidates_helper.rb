module CandidatesHelper

  def cv_link_helper(candidate)
    if candidate.cv.path.blank?
      render(:inline => raw("<i class='icon-minus'></i>"))
    else
      link_to raw("<i class='icon-download'></i>"), download_cv_candidate_path(candidate)
    end
  end

  def existing_cv_helper(candidate)
    unless candidate.cv.path.blank?
      cv_link = "Existing CV: #{link_to(File.basename(candidate.cv.url), download_cv_candidate_path(candidate))}"
      content_tag(:div, cv_link.html_safe, :class => "existing_cv")
    end
  end

  # def candidate_state_select_helper(form)
  #   form.collection_select :state_id, State.all, :id, :state, :class => 'select_field'
  # end

end
