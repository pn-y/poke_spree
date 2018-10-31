class Spree::Admin::ProductImportsController < Spree::Admin::BaseController
  def index
    @product_imports = ProductImport.page(page).per(per_page)
  end

  def new
    @product_import = ProductImport.new
  end

  def create
    @product_import = ProductImport.new(product_import_params)
    if @product_import.save
      ProductImportWorker.perform_async(@product_import.id)
      redirect_to admin_product_imports_url
    else
      render :new
    end
  end

  private

  def product_import_params
    params.require(:product_import).permit(:import_file)
  end
end
