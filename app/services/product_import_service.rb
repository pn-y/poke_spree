require 'csv'

class ProductImportService
  BLANK_LINE_REGEX = /^(?:;\s*)+$/

  class << self
    def import(product_import)
      CSV.readlines(
        product_import.import_file.path,
        headers: true,
        skip_blanks: true,
        skip_lines: BLANK_LINE_REGEX,
        col_sep: ';',
        header_converters: :symbol
      ).each do |row|
          process_row(row)
      end
    end

    private

    def process_row(row)
      new_product = Spree::Product.new
      new_product.name = row[:name]
      new_product.description = row[:description]
      new_product.available_on = row[:availability_date]
      new_product.slug = row[:slug]
      new_product.taxons = [get_taxon(row[:category])]
      new_product.price = row[:price]
      new_product.master.stock_items.new(
        stock_location: get_stock_location,
        count_on_hand: row[:stock_total]
      )
      new_product.shipping_category = get_shipping_category

      new_product.save!
    end

    def get_taxon(taxon_name)
      Spree::Taxon.find_by!(name: taxon_name)
    end

    def get_shipping_category
      Spree::ShippingCategory.find_by!(name: 'default')
    end

    def get_stock_location
      Spree::StockLocation.find_by!(name: 'default')
    end
  end
end
