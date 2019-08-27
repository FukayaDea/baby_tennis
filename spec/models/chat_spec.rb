require 'rails_helper'
describe Chat do
  describe '#create' do
	it "is valid with text" do
	    chat = Chat.new(text: "test")
	    expect(chat).to be_valid
	end
  it "is valid without text" do
      chat = Chat.new(text: nil)
      expect(chat).to be_valid
  end

  end
end