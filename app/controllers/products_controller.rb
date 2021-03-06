class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(products_params)
		if @product.save
			redirect_to products_path, notice: 'El Producto fue publicado con exito'
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(products_params)
			redirect_to products_path
		else
			render :edit
		end
	end

	private
		def products_params
			params.require(:product).permit(:name, :url, :description)
		end
end