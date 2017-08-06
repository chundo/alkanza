class PalabrasController < ApplicationController
  before_action :set_palabra, only: [:show, :edit, :update, :destroy]

  # GET /palabras
  # GET /palabras.json
  def index
    @palabras = Palabra.all
  end

  # GET /palabras/1
  # GET /palabras/1.json
  def show
  end

  # GET /palabras/new
  def new
    @palabra = Palabra.new
  end

  # GET /palabras/1/edit
  def edit
  end

  # POST /palabras
  # POST /palabras.json
  def create
    @palabra = Palabra.new(palabra_params)

    respond_to do |format|
      if @palabra.save
        format.html { redirect_to @palabra, notice: 'Palabra was successfully created.' }
        format.json { render :show, status: :created, location: @palabra }
      else
        format.html { render :new }
        format.json { render json: @palabra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /palabras/1
  # PATCH/PUT /palabras/1.json
  def update
    respond_to do |format|
      if @palabra.update(palabra_params)
        format.html { redirect_to @palabra, notice: 'Palabra was successfully updated.' }
        format.json { render :show, status: :ok, location: @palabra }
      else
        format.html { render :edit }
        format.json { render json: @palabra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palabras/1
  # DELETE /palabras/1.json
  def destroy
    @palabra.destroy
    respond_to do |format|
      format.html { redirect_to palabras_url, notice: 'Palabra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palabra
      @palabra = Palabra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def palabra_params
      params.require(:palabra).permit(:nombre)
    end
end
