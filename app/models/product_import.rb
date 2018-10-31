class ProductImport < ApplicationRecord
  include ProductImportStateMachine

  has_attached_file :import_file
  validates_attachment_content_type :import_file, :content_type => ["text/csv", 'text/plain']
end
