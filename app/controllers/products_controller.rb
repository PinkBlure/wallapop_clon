# products_controller --> Plural por convención en rails
# hereda de ApplicationController que contiene la lógica para hacer que la
# clase sea un controlador

# Framework modelo vista-controlador
# Modelo --> Consultas, validaciones, relaciones
# Vista --> Devolver al usuario html, pdf, csv, json
# Controlador --> Lógica

class ProductsController < ApplicationController
    # Declaramos el método
    # Index es para devolver un conjunto de cosas
    def index
        # Variable de instancia
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path, notice: 'Tu producto se ha creado correctamente'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
            redirect_to products_path, notice: 'Tu producto se ha actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def product_params
        params.require(:product).permit(:title, :description, :price)
    end
end