require 'rails_helper'

describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Abel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life goes on.')
    @post = Post.new(author: @author, title: 'My 1st blog', text: 'This is my first blog post')
    @comment = Comment.create(post: @post, author: @author, text: 'Hi Tom!')
  end

  it 'should increment the amount of comments' do
    @comment.update_comments_count
    expect(@post.comments_counter).to eq 2
  end
end
