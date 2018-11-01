RSpec.shared_context "create defaults" do
  before do
    FactoryBot.create(:shipping_category, name: 'default')
    FactoryBot.create(:stock_location, name: 'default')
    FactoryBot.create(:taxon, name: 'Bags')
  end
end
