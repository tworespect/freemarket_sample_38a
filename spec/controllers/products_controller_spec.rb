require 'rails_helper'
describe ProductsController, type: :controller do
  describe 'GET #index' do
    it "populates an array of products ordered by id DESC" do
      products = create_list(:product,4)
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.id <=> a.id })
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end

