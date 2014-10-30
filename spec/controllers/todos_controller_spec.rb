require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  let(:list) { FactoryGirl.build(:list) }
  let(:todo) { FactoryGirl.build(:todo) }

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

end
