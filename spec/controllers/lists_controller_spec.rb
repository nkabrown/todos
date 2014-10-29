require 'rails_helper'

RSpec.describe ListsController, :type => :controller do

  let(:valid_attributes) {
    @valid_attributes = {
      title: "Groceries"
    }
  }

  let(:invalid_attributes) {
    @invalid_attributes = {
      title: nil
    }
  }

  let(:valid_session) { {list_id: 1} }

  describe "GET index" do
    it "should respond successfully with an HTTP 200 code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the index template" do
      get :index

      expect(response).to render_template("index")
    end

    it "assigns all lists to @lists" do
      list = List.create! valid_attributes
      get :index, {}, valid_session

      expect(assigns(:lists)).to eq([list])
    end
  end

  describe "GET new" do
    it "assigns a new list as @list" do
      get :new, {}, valid_attributes

      expect(assigns(:list)).to be_a_new(List)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new list" do
        expect {
          post :create, {list: valid_attributes}, valid_session
        }.to change(List, :count).by(1)
      end

      it "assigns a newly created list as @list" do
        post :create, {list: valid_attributes}, valid_session

        expect(assigns(:list)).to be_a(List)
        expect(assigns(:list)).to be_persisted
      end

      it "redirects to the lists page" do
        post :create, {list: valid_attributes}, valid_session

        expect(response).to redirect_to(lists_path)
      end
    end

    context "with invalid params" do
      it "it assigns a newly created but unsaved list as @list" do
        post :create, {list: invalid_attributes}, valid_session

        expect(assigns(:list)).to be_a_new(List)
      end

      it "re-renders the new template" do
        post :create, {list: invalid_attributes}, valid_session

        expect(response).to render_template("new")
      end
    end
  end
end
