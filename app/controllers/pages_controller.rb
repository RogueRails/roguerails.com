class PagesController < ApplicationController
  def show
    render params[:id].gsub(/\-/, '_')
  rescue
    render template: "pages/index"
  end

  def schedule
    render layout: false
  end
end
