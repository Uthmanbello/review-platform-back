class ProductsController < ApplicationController
  before_action :set_sub_category
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  # def show
  # end

  def show
    @product = Product.find(params[:id])
    @sub_category = @product.sub_category
    @category = @sub_category.category
  end
  

  # GET /products/new
  # def new
  #   @product = Product.new
  # end

  # def new
  #   @sub_category = SubCategory.find(params[:sub_category_id])
  #   @product = @sub_category.products.build
  # end

  def new
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:sub_category_id])
    @product = Product.new
  end
  
  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image]) if params[:product][:image]

    respond_to do |format|
      if @product.save
        format.html { redirect_to category_sub_category_path(@product.sub_category.category, @product.sub_category), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: category_sub_category_path(@product.sub_category.category, @product.sub_category) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:sub_category_id])
    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to category_sub_category_path(@product.sub_category.category, @product.sub_category), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :delivery_cost, :delivery_time, :vendor, :description, :quantity, :size, :sub_category_id, :image)
    end

    def set_sub_category
      @sub_category = SubCategory.find(params[:sub_category_id])
    end
end
