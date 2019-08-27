require 'rails_helper'

describe EventsController do
let!(:user) { build(:user) }

before do
  user.skip_confirmation!
  user.save!
  login_user user
end
  describe 'GET #index' do
    it "populates an array of events ordered by updated_at DESC" do
      events = create_list(:event, 3)
      get :index
      expect(assigns(:events)).to match(events.sort{ |a, b| b.updated_at <=> a.updated_at } )
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
        post :create, params: { event: attributes_for(:event) }
      }.to change(Event, :count).by(1)
    end
    it "saves the new contact in the database with create_group" do
      expect{
        post :create, params: { event: attributes_for(:event_with_create_group) }
      }.to change(Event, :count).by(1)
    end
    it "redirects to event#index" do
      post :create, params: { event: attributes_for(:event) }
      expect(response).to render_template :create
    end
  end


  describe 'PATCH #update' do
      it "locates the requersted @event" do
        event = create(:event)
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(assigns(:event)).to eq event
      end

      it "changes @event's attributes" do
        event = create(:event)
        patch :update, params: { id: event, event: attributes_for(:event, prefecture: 'hoge') }
        event.reload
        expect(event.prefecture).to eq("hoge")
      end

      it "redirects to event_path" do
        event = create(:event)
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(response).to redirect_to event_path
      end
   end

  describe 'GET #show' do
    it "assigns the requested contact to @event" do
    	event = create(:event)
    	event_time = event.meeting_time.strftime("%H時%M分")
    	get :show,  params: { id: event }
    	expect(assigns(:event)).to eq event
    	expect(assigns(:event_time)).to eq event_time

    end

    it "renders the :show template" do
    	event = create(:event)
    	get :show, params: { id: event }
    	expect(response).to render_template :show

    end
  end

  describe 'GET #edit' do

    it "assigns the requested contact to @event" do
    	event = create(:event)
    	get :edit,  params: { id: event }
    	expect(assigns(:event)).to eq event
    end

    it "renders the :edit template" do
    	event = create(:event)
    	get :edit, params: { id: event }
    	expect(response).to render_template :edit

    end
  end

  describe 'delete #destroy' do
    it "deletes the event" do
      event = create(:event)
      expect{
        delete :destroy, params: { id: event }
      }.to change(Event,:count).by(-1)
    end
  end

end