require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  describe "GET new" do
    it "should respond successfully with an HTTP 200 code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    xit "should render the new template" do
      get :new

      expect(response).to render_template("new")
    end

  end

end
