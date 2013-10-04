require 'spec_helper'

describe PagesController do
  describe "GET 'show'" do
    it "displays the view that matches the id" do
      get 'show'
      response.should render_template "pages/index"
    end
  end
end
