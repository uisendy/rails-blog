require 'rails_helper'

describe "Posts controller", :type => :request do
  it "should create a posts page and show list of posts" do
    get '/users/123/posts'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('This is a list of posts')
  end

  it "should create a post page and show details about a post" do
    get '/users/123/posts/321'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('This is some post by a user')   
  end

end