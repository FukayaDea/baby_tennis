require 'rails_helper'
describe TennisInfo do
  describe '#create' do
	it "is valid with text" do
	    tennis_info = TennisInfo.new(text: "test")
	    expect(tennis_info).to be_valid
	end
  it "is valid without text" do
      tennis_info = TennisInfo.new(text: nil)
      expect(tennis_info).to be_valid
  end

  end
end