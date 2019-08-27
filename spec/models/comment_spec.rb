require 'rails_helper'
describe Comment do
  describe '#create' do
	it "is valid with text" do
	    comment = Comment.new(text: "test")
	    expect(comment).to be_valid
	end
  it "is valid without text" do
      comment = Comment.new(text: nil)
      expect(comment).to be_valid
  end

  end
end