class FacebookReviewsController < ApplicationController
  before_action :set_facebook_review, only: %i[ show edit update destroy ]

  # GET /facebook_reviews or /facebook_reviews.json
  def index
    @facebook_reviews = FacebookReview.all
  end

  # GET /facebook_reviews/1 or /facebook_reviews/1.json
  def show
  end

  # GET /facebook_reviews/new
  def new
    @facebook_review = FacebookReview.new
  end

  # GET /facebook_reviews/1/edit
  def edit
  end

  # POST /facebook_reviews or /facebook_reviews.json
  def create
    @facebook_review = FacebookReview.new(facebook_review_params)

    respond_to do |format|
      if @facebook_review.save
        format.html { redirect_to facebook_review_url(@facebook_review), notice: "Facebook review was successfully created." }
        format.json { render :show, status: :created, location: @facebook_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @facebook_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_reviews/1 or /facebook_reviews/1.json
  def update
    respond_to do |format|
      if @facebook_review.update(facebook_review_params)
        format.html { redirect_to facebook_review_url(@facebook_review), notice: "Facebook review was successfully updated." }
        format.json { render :show, status: :ok, location: @facebook_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @facebook_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_reviews/1 or /facebook_reviews/1.json
  def destroy
    @facebook_review.destroy

    respond_to do |format|
      format.html { redirect_to facebook_reviews_url, notice: "Facebook review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_review
      @facebook_review = FacebookReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facebook_review_params
      params.require(:facebook_review).permit(:full_name, :username, :review_text)
    end
end
