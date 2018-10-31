class ProductImportWorker
  include Sidekiq::Worker

  def perform(product_import_id)
    product_import = ProductImport.find(product_import_id)
    product_import.start
    product_import.finish
  end
end
