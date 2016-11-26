class ProductsController < ApplicationController

  def index
    @products = Product.all
    @brand=Brand.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new ({name: params[:product][:name], brand_id: params[:product][:brand_id],description: params[:product][:description],price: params[:product][:price]})

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end

  def update
  end

  def destroy
    @product=Product.find(params[:id])
     @product.destroy #Elimina el objeto de la base de datos
      redirect_to products_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name,:brand_id,:description,:price)
    end

  end
