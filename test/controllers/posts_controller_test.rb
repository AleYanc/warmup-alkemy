require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    # Crear dummy user
    @user = User.create(email: 'testuser@test.com', password: '123456')
    # Usando el dummy user, crear un token para autenticar y autorizar el uso de las rutas
    @token = AuthTokenService.call(@user.id)
    # Crea un dummy post para mostrar en la ruta de show
    @post = Post.create(title: 'Test', content: 'Test', img: 'test.png', user_id: @user.id, category: 'testcat')
  end

  test 'should get posts index' do
    get api_v1_posts_path
    assert_response :success
  end

  test 'should create post' do
    post '/api/v1/posts', params: {title: 'Test', content: 'Test', img: 'test.png', user_id: @user.id, category: 'testcat'},headers: {'Authorization' => "Bearer #{@token}"}
    assert_response :success
  end

  test 'should NOT create post when token is missing or incorrect' do
    post '/api/v1/posts', params: {title: 'Test', content: 'Test', img: 'test.png', user_id: @user.id, category: 'testcat'},headers: {'Authorization' => "Bearer "}
    assert_response :unauthorized
  end

  test 'should NOT create post when there are missing post params' do
    post '/api/v1/posts', params: {title: '', content: '', img: '', user_id: '', category: ''}, headers: {'Authorization' => "Bearer #{@token}"}
    assert_response :unprocessable_entity
  end

  test 'should show post' do
    get api_v1_post_path(@post)
    assert_response :success
  end



end