require 'rails_helper'

RSpec.describe ListsController, :type => :controller do
  
  describe "GET index" do
    it "should respond successfully with an HTTP 200 code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
