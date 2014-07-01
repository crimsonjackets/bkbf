class PagesController < ApplicationController
  def show
    @page = Page.find_by name: params[:page_name]
  end
end
