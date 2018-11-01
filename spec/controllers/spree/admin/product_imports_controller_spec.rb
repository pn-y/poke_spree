require 'rails_helper'

describe Spree::Admin::ProductImportsController, :create_defaults do
  render_views

  let(:admin) { create :admin_user }

  before do
    sign_in(admin, scope: :spree_user)
  end

  it 'gets #index' do
    spree_get :index
    expect(response).to have_http_status(:success)
  end

  it 'gets #new' do
    spree_get :new
    expect(response).to have_http_status(:success)
  end

  it 'posts #create' do
    product_import_attrs = attributes_for(:product_import)
    expect{
      spree_post :create, { product_import: product_import_attrs }
    }.to change{ ProductImport.count }.by(1)
  end
end
