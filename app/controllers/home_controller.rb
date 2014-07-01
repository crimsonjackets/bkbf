class HomeController < ApplicationController
  def index
    @slides = Slide.take 3
  end
end