 require 'rails_helper'

describe Vote do
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
end
     
