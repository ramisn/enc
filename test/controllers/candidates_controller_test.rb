require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { address1: @candidate.address1, address: @candidate.address, city: @candidate.city, cv: @candidate.cv, dob: @candidate.dob, education: @candidate.education, email: @candidate.email, first_name: @candidate.first_name, gender: @candidate.gender, home_phone: @candidate.home_phone, language: @candidate.language, last_name: @candidate.last_name, mobile: @candidate.mobile, state: @candidate.state, website: @candidate.website, zip: @candidate.zip }
    end

    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate
    assert_response :success
  end

  test "should update candidate" do
    patch :update, id: @candidate, candidate: { address1: @candidate.address1, address: @candidate.address, city: @candidate.city, cv: @candidate.cv, dob: @candidate.dob, education: @candidate.education, email: @candidate.email, first_name: @candidate.first_name, gender: @candidate.gender, home_phone: @candidate.home_phone, language: @candidate.language, last_name: @candidate.last_name, mobile: @candidate.mobile, state: @candidate.state, website: @candidate.website, zip: @candidate.zip }
    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete :destroy, id: @candidate
    end

    assert_redirected_to candidates_path
  end
end
