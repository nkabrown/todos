require 'rails_helper'

RSpec.describe ListsController, :type => :controller do

  let(:list) { FactoryGirl.build(:list) }

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
      list = create(:list)
      get :index, {}, valid_session

      expect(assigns(:lists)).to eq([list])
    end
  end

  describe "GET show" do
    it "should respond successfully with an HTTP 200 code" do
      list = create(:list)
      get :show, {id: list.to_param}, valid_session

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the show template" do
      list = create(:list)
      get :show, {id: list.to_param}, valid_session

      expect(response).to render_template("show")
    end

    it "assigns the list to @list" do
      list = create(:list)
      get :show, {id: list.to_param}, valid_session

      expect(assigns(:list)).to eq(list)
    end
  end

  describe "GET new" do
    it "should respond successfully with an HTTP 200 code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the new template" do
      get :new

      expect(response).to render_template("new")
    end

    it "assigns a new list as @list" do
      get :new, {}, attributes_for(:list)

      expect(assigns(:list)).to be_a_new(List)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new list" do
        expect {
          post :create, {list: attributes_for(:list)}, valid_session
        }.to change(List, :count).by(1)
      end

      it "assigns a newly created list as @list" do
        post :create, {list: attributes_for(:list)}, valid_session

        expect(assigns(:list)).to be_a(List)
        expect(assigns(:list)).to be_persisted
      end

      it "redirects to the lists page" do
        post :create, {list: attributes_for(:list)}, valid_session

        expect(response).to redirect_to(lists_path)
      end
    end

    context "with invalid params" do
      it "it assigns a newly created but unsaved list as @list" do
        post :create, {list: attributes_for(:invalid_list)}, valid_session

        expect(assigns(:list)).to be_a_new(List)
      end

      it "re-renders the new template" do
        post :create, {list: attributes_for(:invalid_list)}, valid_session

        expect(response).to render_template("new")
      end
    end
  end

  describe "GET edit" do
    it "assigns the requested list to @list" do
      list = create(:list)
      get :edit, {id: list.to_param}, valid_session

      expect(assigns(:list)).to eq(list)
    end
  end

  describe "PUT update" do
    let(:new_attributes) {
      @new_attributes = {
        title: "Projects"
      }
    }

    context "with valid params" do
      it "updates the requested list" do
        list = create(:list)
        put :update, {id: list.to_param, list: new_attributes}, valid_session
        list.reload

        expect(list.title).to eq("Projects")
      end

      it "assigns the list as @list" do
        list = create(:list)
        put :update, {id: list.to_param, list: new_attributes}, valid_session

        expect(assigns(:list)).to eq(list)
      end

      it "redirects to the lists page" do
        list = create(:list)
        put :update, {id: list.to_param, list: new_attributes}, valid_session

        expect(response).to redirect_to(lists_path)
      end
    end

    context "with invalid params" do
      it "assigns the list as @list" do
        list = create(:list)
        put :update, {id: list.to_param, list: attributes_for(:invalid_list)}, valid_session

        expect(assigns(:list)).to eq(list)
      end

      it "re-renders the edit view" do
        list = create(:list)
        put :update, {id: list.to_param, list: attributes_for(:invalid_list)}, valid_session

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested list" do
      list = create(:list)
      expect {
        delete :destroy, {id: list.to_param}, valid_session
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists page" do
      list = create(:list)
      delete :destroy, {id: list.to_param}, valid_session

      expect(response).to redirect_to(lists_path)
    end
  end
end
