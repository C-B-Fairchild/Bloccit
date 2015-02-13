require 'rails_helper'

describe Vote do
  include TestFactories
  describe "validations" do
    describe "value validation" do
      it "allows 1 as value" do
        up_vote = Vote.new(value: 1)
        expect(up_vote.valid?).to eq(true)
      end

      it "allows -1 as a value" do
        down_vote = Vote.new(value: -1)
        expect(down_vote.valid?).to eq(true)
      end
      
      it "doesn't allow > 1 absolute value for  vote" do
        total = Vote.new(value: 2)
        expect(total.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
        vote.save
    end
  end
end


     
