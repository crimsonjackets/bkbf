class Admin::PagesController < AdminController
  before_action :find_page, only: [:edit, :update, :destroy]
  def index
    @pages = Page.all
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path
  end

  private
    def find_page
      @page = Page.find params[:id]
    end

    def page_params
      params.require(:page).permit(:image, :title, :file, :text_block_1, :text_block_2)
    end
end
