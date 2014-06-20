class Admin::PagesController < AdminController
  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find params[:id]
  end

  def update
    @page = Page.find params[:id]
    if @page.update(page_params)
      redirect_to admin_pages_path
    else
      render 'edit'
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to admin_pages_path
  end

  private
    def page_params
      params.require(:page).permit(:image, :title, :file, :text_block_1, :text_block_2)
    end
end
