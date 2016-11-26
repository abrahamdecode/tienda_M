class BrandsController < ApplicationController

def index
  @brands = Brand.all
end

def show
  @brand = Brand.find(params[:id])
end

def new
  @brand = Brand.new
end

def create
  @brand = Brand.new(brand_params)

  respond_to do |format|
    if @brand.save
      format.html { redirect_to @brand, notice: 'brand was successfully created.' }
      format.json { render :show, status: :created, location: @brand }
    else
      format.html { render :new }
      format.json { render json: @brand.errors, status: :unprocessable_entity }
    end
  end
end


def edit
end

def update
end

def destroy
  @brand=Brand.find(params[:id])
   @brand.destroy #Elimina el objeto de la base de datos
    redirect_to brands_path
end
private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:name)
  end

end
