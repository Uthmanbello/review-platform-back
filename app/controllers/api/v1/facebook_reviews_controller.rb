# class Api::V1::ProductsController < ApplicationController
#   def index
#   end

#   def show
#   end
# end

module Api
    module V1
      class FacebookReviewsController < ApplicationController
        def index
          ActiveStorage::Current.url_options = {
            host: request.base_url,
            protocol: request.protocol
            # Add any other necessary options
          }
  
          @facebook_reviews = FacebookReview.all
          render json: @facebook_reviews
        end
  
        def show
          @facebook_review = FacebookReview.find(params[:id])
          render json: @facebook_review
        end
      end
    end
  end
  