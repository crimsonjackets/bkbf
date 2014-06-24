class Admin::SlidesController < AdminController
  before_action :find_slide, only: [:edit, :update, :destroy]
  def index
    @slides = Slide.all
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    if Slide.all.count <=2 && @slide.save
      redirect_to admin_slides_path
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    if @slide.update(slide_params)
      redirect_to admin_slides_path
    else
      render 'edit'
    end
  end

  def destroy
    @slide.destroy
    redirect_to admin_slides_path
  end

  private
    def find_slide
      @slide = Slide.find params[:id]
    end
    def slide_params
      params.require(:slide).permit(:image, :title, :text)
    end
end
