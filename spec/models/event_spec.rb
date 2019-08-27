require 'rails_helper'
describe Event do
  describe '#create' do
  	it "is valid" do
     event = build(:event)
     expect(event).to be_valid
    end
    it "is invalid without a event_date" do
     event = build(:event, event_date: "")
     event.valid?
     expect(event.errors[:event_date]).to include("を入力してください。")
    end
    it "is invalid without a prefecture" do
      event = build(:event, prefecture: "")
      event.valid?
      expect(event.errors[:prefecture]).to include("を入力してください。")
    end
    it "is valid without a court" do
      event = build(:event, court: "")
      expect(event).to be_valid
    end
    it "is valid without a court_url" do
      event = build(:event, court_url: "")
      expect(event).to be_valid
    end
    it "is invalid without a meeting_place" do
      event = build(:event, meeting_place: "")
      event.valid?
      expect(event.errors[:meeting_place]).to include("を入力してください。")
    end
    it "is invalid without a meeting_time" do
      event = build(:event, meeting_time: "")
      event.valid?
      expect(event.errors[:meeting_time]).to include("を入力してください。")
    end
    it "is valid without a access" do
      event = build(:event, access: "")
      expect(event).to be_valid
    end
    it "is valid without a budget" do
      event = build(:event, budget: "")
      expect(event).to be_valid
    end
    it "is valid without a max_member" do
      event = build(:event, max_member: "")
      expect(event).to be_valid
    end
    it "is valid without a remarks" do
      event = build(:event, remarks: "")
      expect(event).to be_valid
    end
    it "is valid with racket 2" do
      event = build(:event, racket: 2)
      expect(event).to be_valid
    end
    it "is valid with racket 3" do
      event = build(:event, racket: 3)
      expect(event).to be_valid
    end
  end
end