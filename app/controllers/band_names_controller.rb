class BandNamesController < ApplicationController
  before_action :set_band_name, only: [:show, :edit, :update, :destroy]

  # GET /band_names
  # GET /band_names.json
  def index
    @band_names = BandName.all
  end

  # GET /band_names/1
  # GET /band_names/1.json
  def show
  end

  # GET /band_names/new
  def new
    @band_name = BandName.new
  end

  # GET /band_names/1/edit
  def edit
  end

  # POST /band_names
  # POST /band_names.json
  def create
    @band_name = BandName.new(band_name_params)

    respond_to do |format|
      if @band_name.save
        format.html { redirect_to '/', notice: 'Band name was successfully created.' }
        format.json { render :show, status: :created, location: @band_name }
      else
        format.html { render :new }
        format.json { render json: @band_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /band_names/1
  # PATCH/PUT /band_names/1.json
  def update
    respond_to do |format|
      if @band_name.update(band_name_params)
        format.html { redirect_to @band_name, notice: 'Band name was successfully updated.' }
        format.json { render :show, status: :ok, location: @band_name }
      else
        format.html { render :edit }
        format.json { render json: @band_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /band_names/1
  # DELETE /band_names/1.json
  def destroy
    @band_name.destroy
    respond_to do |format|
      format.html { redirect_to band_names_url, notice: 'Band name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_name
      @band_name = BandName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_name_params
      params.require(:band_name).permit(:name, :date)
    end
end
