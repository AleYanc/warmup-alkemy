require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(email: 'etc@etc.com', password: '123456')
  end

  test 'should get users index' do
    get api_v1_users_path
    assert_response :success
  end

  test 'should create user' do
    post '/api/v1/users', params: {email: 'testuser@test.com', password: '123456'}
    assert_response :success
  end

  test 'should NOT create user when there are missing user params' do
    post '/api/v1/users', params: {email: '', password: ''}
    assert_response :unprocessable_entity
  end

  test 'should NOT create user when email format is incorrect' do
    post '/api/v1/users', params: {email: 'abc.com', password: ''}
    assert_response :unprocessable_entity
  end

  test 'should show user' do
    get api_v1_user_path(@user)
    assert_response :success
  end

end