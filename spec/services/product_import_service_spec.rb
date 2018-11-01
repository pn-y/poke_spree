require 'rails_helper'

describe ProductImportService, :create_defaults do
  let(:product_import) { create :product_import }

  before do
    create(:taxon, name: 'Bags')
  end

  it 'imports products' do
    expect(Spree::Product.count).to eq(0)

    ProductImportService.import(product_import)

    expect(Spree::Product.exists?(name: 'Ruby on Rails Bag')).to eq(true)
    expect(Spree::Product.exists?(name: 'Spree Bag')).to eq(true)
    expect(Spree::Product.exists?(name: 'Spree Tote')).to eq(true)
  end
end

