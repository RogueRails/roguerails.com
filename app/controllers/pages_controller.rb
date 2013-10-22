class PagesController < ApplicationController
  def show
    render params[:id].gsub(/\-/, '_')
  rescue
    render template: "pages/index"
  end

  def schedule
    render layout: false
  end

  def eventapp
    render layout: false
  end

  def playbook
    render layout: false
  end

  def agile_process
    render layout: false
  end

  def tdd
    render layout: false
  end 
end
