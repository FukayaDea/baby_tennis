require 'rails_helper'
describe Diary do
  describe '#create' do
	it "is valid with text" do
	    diary = Diary.new(text: "test")
	    expect(diary).to be_valid
	end
  it "is valid without text" do
      diary = Diary.new(text: nil)
      expect(diary).to be_valid
  end

  end
end