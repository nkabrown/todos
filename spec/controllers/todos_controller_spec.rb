require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  let(:list) { FactoryGirl.build(:list) }
  let(:todo) { FactoryGirl.build(:todo) }
  let(:invalid_todo) { FactoryGirl.build(:invalid_todo) }

  let(:valid_session) { {list_id: 1} }

  describe "GET new" do
    it "should respond successfully with an HTTP 200 code" do
      list = create(:list)
      get :new, {list_id: list.id}, valid_session

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the new template" do
      list = create(:list)
      get :new, {list_id: list.id}, valid_session

      expect(response).to render_template("new")
    end

    it "assigns a new todo as @todo" do
      list = create(:list)
      get :new, {list_id: list.to_param}, attributes_for(:todo)

      expect(assigns(:todo)).to be_a_new(Todo)
    end

  end

  describe "POST create" do

    context "with valid params" do
      it "creates a new todo" do
        expect {
          list = create(:list)
          post :create, {list_id: list.id, todo: attributes_for(:todo)}, valid_session
        }.to change(Todo, :count).by(1)
      end

      it "assigns a newly created todo as @todo" do
        list = create(:list)
        post :create, {list_id: list.id, todo: attributes_for(:todo)}, valid_session

        expect(assigns(:todo)).to be_a(Todo)
        expect(assigns(:todo)).to be_persisted
      end

      it "redirects to its list page" do
        list = create(:list)
        post :create, {list_id: list.id, todo: attributes_for(:todo)}, valid_session

        expect(response).to redirect_to(list_path(:list_id))
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved todo as @todo" do
        list = create(:list)
        post :create, {list_id: list.id, todo: attributes_for(:invalid_todo)}, valid_session

        expect(assigns(:todo)).to be_a_new(Todo)
      end

      it "re-renders the new template" do
        list = create(:list)
        post :create, {list_id: list.id, todo: attributes_for(:invalid_todo)}, valid_session

        expect(response).to render_template("new")
      end
    end

  end
end
