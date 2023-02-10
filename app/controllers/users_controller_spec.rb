require 'rails_helper'

describe 'Users controller', type: :request do
  it 'should create a users page and show a list of users' do
    get '/users'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('This is a list of users')
  end

  it 'should create a user page and show details about a user' do
    get '/users/123'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('This is a detail about some user')
  end
end
