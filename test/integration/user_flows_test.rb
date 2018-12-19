require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
    test "Login and browse" do
        get '/users/sign_in'
        post '/users/sign_in', params: { user: { email: users(:juan).email, password: 'hola1234' } }
        follow_redirect!
        assert_equal '/', path
        assert_equal 'Signed in successfully.', flash[:notice]
    end 
end