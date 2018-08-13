require 'rails_helper'

RSpec.describe PackagesController, type: :controller do
  describe "GET index" do
    it "render view" do
        get :index
        expect(response).to render_template("index")
    end
  end
end
