class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    
    Product.create(:title => "Buritto", :description => "Dang this is good!", :price => 8.99, :stock_quantity => 4)
    
    Product.create(:title => "Taco", :description => "It's like a nacho sandwich!", :price => 3.95, :stock_quantity => 10)   
    
    Product.create(:title => "Diablo 3", :description => "Nourishment for the soul.", :price => 19.99, :stock_quantity => 667)   
    
    Product.create(:title => "Chicken", :description => "Staple for any nuclear family dinner",  :price => 6.99, :stock_quantity => 13)   
    
    Product.create(:title => "Steak", :description => "If they ask for it well done, we kindly but firmly ask them to leave", :price => 12.74, :stock_quantity => 36)
     
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  def avg
    
    products = Product.all
    sum = 0.0
    avg = 0.0
    
    products.each do product
      
      sum += product.price.to_f
      
    end
    
    avg = sum/products.size
    
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :stock_quantity)
    end
    
 
end
