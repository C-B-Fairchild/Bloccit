require 'rails_helper'

describe "Visiting profiles" do 

  include TestFactories
  include Warden::Test::Helpers
    Warden.test_mode!

  #before do 
    
  #end

  describe "not signed in" do 

    it "shows profile" do 
      @user = authenticated_user
      @post = associated_post(user: @user)
      @comment = Comment.new(user: @user, comment: "A Comment")
      allow(@comment).to receive(:send_favorite_emails)
      @comment.save! 
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.comment)
    end
  end

  before do 
    @user = FactoryGirl.create(:user)
    #debugger
    login_as(@user, :scope => :user, :run_callbacks => false)
    @topic = Topic.new(name: "New Topic")
    @topic.save!
    @post = Post.create!(user: @user, title: "This is a test post", body: "Here is the new post", topic: @topic)
    @comment = Comment.new(user: @user, post: @post, comment: "Here's a comment.")
    @comment.save!
  end

  describe "user signed in" do 
    it "shows profile" do 
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.comment)   
    end

    after do 
      Warden.test_reset! 
    end
  end




end