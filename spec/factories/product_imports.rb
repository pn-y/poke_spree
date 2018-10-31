FactoryBot.define do
  factory :product_import do
    import_file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'product_imports', 'import_file_example.csv')) }
  end
end
