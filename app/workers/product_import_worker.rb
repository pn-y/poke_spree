class ProductImportWorker
  include Sidekiq::Worker

  def perform(product_import_id)
    product_import = ProductImport.find(product_import_id)
    product_import.start
    ProductImportService.import(product_import)
    product_import.finish
  end
end
