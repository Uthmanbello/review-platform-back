# class Api::V1::SubCategoriesController < ApplicationController
#   def index
#   end

#   def show
#   end
# end

module Api
  module V1
    class SubCategoriesController < ApplicationController
      def index
        @sub_categories = SubCategory.includes(:category)
        render json: @sub_categories, include: :category
      end

      def show
        @sub_category = SubCategory.includes(:category).find(params[:id])
        render json: @sub_category, include: :category
      end
    end
  end
end
