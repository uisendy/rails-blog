require 'rails_helper'

describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Abel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life goes on.') }
  before { subject.save }

  it 'should be invalid for a blank name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid for a given name' do
    expect(subject).to be_valid
  end

  it 'should be invalid for a negative posts counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should return the last 3 posts (if any) for a given user' do
    4.times { |num| Post.create(author: subject, title: 'Hello', text: "This is post No: #{num + 1}") }

    expect(subject.recent_posts.length).to eq 3
    expect(subject.recent_posts[-1].text).to eq('This is post No: 3')
  end
end
