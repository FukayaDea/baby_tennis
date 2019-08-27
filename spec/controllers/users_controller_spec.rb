require 'rails_helper'

describe UsersController do
let!(:user) { build(:user) }

before do
  user.skip_confirmation!
  user.save!
  login_user user

end

  describe 'GET #show' do
    it "assigns the requested contact to @user" do
        event = create(:event)
    	get :show,  params: { id: user }
    	expect(assigns(:user)).to eq user


    end

    it "renders the :show template" do  
    	get :show, params: { id: user }
    	expect(response).to render_template :show

    end
  end

  describe 'GET #edit' do

    it "renders the :edit template" do
    	get :edit, params: { id: user }
    	expect(response).to render_template :edit
    end
  end

  describe 'GET #email_new' do

    it "renders the :email_new template" do
    	get :email_new, params: { id: user }
    	expect(response).to render_template :email_new
    end
  end

  describe 'PATCH #update' do

      it "changes @user's attributes" do

        patch :update, params: { id: user, user: attributes_for(:user, nickname: 'hoge') }
        user.reload
        expect(user.nickname).to eq("hoge")
      end

      it "redirects to event_path" do
        patch :update, params: { id: user, user: attributes_for(:user) }
        expect(response).to redirect_to user_path
      end
   end

	xit 'userを削除すると、userが書いたeventも削除されること' do
	  create(:event_with_create_group, user_id: user.id)

	  expect{ user.destroy }.to change{ Event.count }.by(-1)
	end
end