require 'rails_helper'

describe User do 
  include TestFactories

  before do 
    @user = authenticated_user
    @post = associated_post
  end

  describe "#favorited(post)" do 
    it "returns 'nil' if the user has not favorited the post" do
      expect ( @user.favorited(@post)) == nil
    end

    it "returns the appropriate favorite if it exists" do
      @favorite = @user.favorites.build(post: @post)
      @favorite.save
      expect( @user.favorited( @post )) == @favorite
    end
  end
end