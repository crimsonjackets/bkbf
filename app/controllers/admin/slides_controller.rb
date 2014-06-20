class Admin::SlidesController < AdminController
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
    @slide = Slide.find params[:id]
  end

  def update
    @slide = Slide.find params[:id]
    if @slide.update(slide_params)
      redirect_to admin_slides_path
    else
      render 'edit'
    end
  end

  def destroy
    Slide.find(params[:id]).destroy
    redirect_to admin_slides_path
  end

  private
    def slide_params
      params.require(:slide).permit(:image, :title, :text)
    end
end
