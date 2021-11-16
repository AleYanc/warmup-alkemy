require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(email: 'testuser@test.com', password: '123456')
  end

  test 'should return token' do
    # Pasando el test user creado, debería hacer un post correctamente a la ruta y devolver un token
    post '/api/v1/auth', params: {email: 'testuser@test.com', password: '123456'}
    assert_response :success
    # toma la respuesta y la convierte en un hash que representa el json
    token = JSON.parse(@response.body)
    # se asegura que el token sea igual al que está en el json
    assert_equal 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5ODAxOTA5NjN9.oT3MQ1nxhEMR4xot7Jjo_on4fWkQFHIl0TUUo8Q-mvY', token['token']
  end

end