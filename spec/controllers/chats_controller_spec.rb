require 'rails_helper'

describe ChatsController do
let!(:user) { build(:user) }

before do
  user.skip_confirmation!
  user.save!
  login_user user
end
  describe 'GET #index' do
    it "populates an array of chats ordered by created_at DESC" do
      chats = create_list(:chat, 3)
      get :index
      expect(assigns(:chats)).to match(chats.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do

    xit "renders the :new template" do
    	get :new
    	expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    xit "saves the new contact in the database" do
      expect{
        post :create, params: { chat: attributes_for(:chat) }
      }.to change(Chat, :count).by(1)
    end

    xit "redirects to chat#index" do
      post :create, params: { chat: attributes_for(:chat) }
      expect(response).to render_template :create
    end
  end


  describe 'delete #destroy' do
    xit "deletes the chat" do
      chat = create(:chat)
      expect{
        delete :destroy, params: { id: chat }
      }.to change(Chat,:count).by(-1)
    end
  end

end