require 'rails_helper'

RSpec.describe ListsController, :type => :controller do

  let(:valid_attributes) {
    @valid_attributes = {
      title: "Groceries"
    }
  }

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
  end

  describe "GET new" do
    it "assigns a new list as @list" do
      get :new, {}, valid_attributes

      expect(assigns(:list)).to be_a_new(List)
    end
  end
end
