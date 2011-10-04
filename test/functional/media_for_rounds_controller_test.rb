require 'test_helper'

class MediaForRoundsControllerTest < ActionController::TestCase
  setup do
    @media_for_round = media_for_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_for_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_for_round" do
    assert_difference('MediaForRound.count') do
      post :create, :media_for_round => @media_for_round.attributes
    end

    assert_redirected_to media_for_round_path(assigns(:media_for_round))
  end

  test "should show media_for_round" do
    get :show, :id => @media_for_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @media_for_round.to_param
    assert_response :success
  end

  test "should update media_for_round" do
    put :update, :id => @media_for_round.to_param, :media_for_round => @media_for_round.attributes
    assert_redirected_to media_for_round_path(assigns(:media_for_round))
  end

  test "should destroy media_for_round" do
    assert_difference('MediaForRound.count', -1) do
      delete :destroy, :id => @media_for_round.to_param
    end

    assert_redirected_to media_for_rounds_path
  end
end
