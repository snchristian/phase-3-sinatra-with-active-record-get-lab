class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

    get '/bakeries/:id' do
    bakeries_id = Bakery.find(params[:id])
    bakeries_id.to_json(include: :baked_goods)
  end
    get '/baked_goods/by_price' do
  bakeries_price = BakedGood.order(price: :desc)
  bakeries_price.to_json
end

  get '/baked_goods/most_expensive' do
expensive_baked_good = BakedGood.order(price: :desc).first
expensive_baked_good.to_json(only: [:name, :price])
  end

end
