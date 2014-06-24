class MaterialsController < ApplicationController
  def index
  end

  def gofrocarton
    @page = Page.find_by(name: 'gofrocarton')
  end
end