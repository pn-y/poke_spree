class CreateProductImports < ActiveRecord::Migration[5.1]
  def change
    create_table :product_imports do |t|
      t.attachment :import_file
      t.string :state
      t.timestamps
    end
  end
end
