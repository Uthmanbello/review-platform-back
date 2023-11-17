# class Api::V1::ProductsController < ApplicationController
#   def index
#   end

#   def show
#   end
# end

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        ActiveStorage::Current.url_options = {
          host: request.base_url,
          protocol: request.protocol
          # Add any other necessary options
        }

        @products = Product.includes(sub_category: :category)
        render json: @products, include: { sub_category: { include: :category } }
      end

      def show
        @product = Product.includes(sub_category: :category).find(params[:id])
        render json: @product, include: { sub_category: { include: :category } }
      end
    end
  end
end
