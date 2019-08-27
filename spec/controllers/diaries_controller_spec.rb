require 'rails_helper'

describe DiariesController do
let!(:user) { build(:user) }

before do
  user.skip_confirmation!
  user.save!
  login_user user
end
  describe 'GET #index' do
    it "populates an array of diaries ordered by created_at DESC" do
      diarys = create_list(:diary, 3)
      get :index
      expect(assigns(:diaries)).to match(diarys.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do

    it "renders the :new template" do
    	get :new
    	expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    it "saves the new contact in the database" do
      expect{
        post :create, params: { diary: attributes_for(:diary) }
      }.to change(Diary, :count).by(1)
    end

    it "redirects to diary#index" do
      post :create, params: { diary: attributes_for(:diary) }
      expect(response).to redirect_to diaries_path
    end
  end


  describe 'delete #destroy' do
    xit "deletes the diary" do
      diary = create(:diary)
      expect{
        delete :destroy, params: { id: diary }
      }.to change(Diary,:count).by(-1)
    end
  end

end