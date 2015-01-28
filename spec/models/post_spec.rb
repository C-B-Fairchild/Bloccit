 require 'rails_helper'
 
 describe Post do
   describe "vote methods" do
 
     before do
       user = User.create
       topic = Topic.create
       @post = Post.create(title: 'post title', body: 'post bodies must be 20 characters or more.', user: user, topic: topic)
       5.times { @post.votes.create(value: 1) }
       7.times { @post.votes.create(value: -1) }
     end
 
     describe '#up_votes' do
       it "counts the number of votes with value = 1" do
         expect( @post.up_votes ).to eq(5)
       end
     end
 
     describe '#down_votes' do
       it "counts the number of votes with value = -1" do
         expect( @post.down_votes ).to eq(7)
       end
     end
 
     describe '#points' do
       it "returns the sum of all down and up votes" do
         expect( @post.points ).to eq(-2) # 5-7
       end
     end
   end
 end