require 'test_helper'

class VoteAlternativesControllerTest < ActionController::TestCase
  setup do
    @vote_alternative = vote_alternatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_alternatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_alternative" do
    assert_difference('VoteAlternative.count') do
      post :create, vote_alternative: { identifier: @vote_alternative.identifier, title: @vote_alternative.title, voting_id: @vote_alternative.voting_id }
    end

    assert_redirected_to vote_alternative_path(assigns(:vote_alternative))
  end

  test "should show vote_alternative" do
    get :show, id: @vote_alternative
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_alternative
    assert_response :success
  end

  test "should update vote_alternative" do
    put :update, id: @vote_alternative, vote_alternative: { identifier: @vote_alternative.identifier, title: @vote_alternative.title, voting_id: @vote_alternative.voting_id }
    assert_redirected_to vote_alternative_path(assigns(:vote_alternative))
  end

  test "should destroy vote_alternative" do
    assert_difference('VoteAlternative.count', -1) do
      delete :destroy, id: @vote_alternative
    end

    assert_redirected_to vote_alternatives_path
  end
end
