class SubCategoriesController < ApplicationController
  before_action :set_category
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  # before_action :set_sub_category, only: %i[ show edit update destroy ]

  # GET /sub_categories or /sub_categories.json
  def index
    @sub_categories = SubCategory.all
  end

  # GET /sub_categories/1 or /sub_categories/1.json
  # def show
  #   @sub_category = SubCategory.find(params[:id])
  # end

  def show
    @sub_category = SubCategory.find(params[:id])
    @category = @sub_category.category
    @products = @sub_category.products
  end
  

  # GET /sub_categories/new
  def new
    # @sub_category = SubCategory.new
    @sub_category = @category.sub_categories.new
  end

  # GET /sub_categories/1/edit
  def edit
  end

  # POST /sub_categories or /sub_categories.json
  # def create
  #   @sub_category = SubCategory.new(sub_category_params)

  #   respond_to do |format|
  #     if @sub_category.save
  #       format.html { redirect_to sub_category_url(@sub_category), notice: "Sub category was successfully created." }
  #       format.json { render :show, status: :created, location: @sub_category }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @sub_category.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @category = Category.find(params[:category_id])
    @sub_category = @category.sub_categories.new(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to category_sub_category_url(@category, @sub_category), notice: "Sub category was successfully created." }
        format.json { render :show, status: :created, location: category_sub_category_url(@category, @sub_category) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categories/1 or /sub_categories/1.json
  # def update
  #   respond_to do |format|
  #     if @sub_category.update(sub_category_params)
  #       format.html { redirect_to sub_category_url(@sub_category), notice: "Sub category was successfully updated." }
  #       format.json { render :show, status: :ok, location: @sub_category }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @sub_category.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to category_sub_category_path(@category, @sub_category), notice: "Sub category was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /sub_categories/1 or /sub_categories/1.json
  # def destroy
  #   @sub_category.destroy

  #   respond_to do |format|
  #     format.html { redirect_to sub_categories_url, notice: "Sub category was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
    @sub_category.products.destroy_all
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: "Sub category was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_sub_category
    #   @sub_category = SubCategory.find(params[:id])
    # end

    def set_category
      @category = Category.find(params[:category_id])
    end
  
    def set_sub_category
      @sub_category = @category.sub_categories.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def sub_category_params
    #   params.require(:sub_category).permit(:name, :category_id)
    # end

    def sub_category_params
      params.require(:sub_category).permit(:name, :other_fields) # Add other permitted fields
    end
end
