class PagesController < ApplicationController
  def show
    render params[:id].gsub(/\-/, '_')
  rescue
    render template: "pages/index"
  end

  def dev_survey
    render template: "pages/dev_survey"
  end
end
