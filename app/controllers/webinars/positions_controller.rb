class Webinars::PositionsController < ApplicationController
  before_action :set_webinars_position, only: [:show, :edit, :update, :destroy]

  # GET /webinars/positions
  # GET /webinars/positions.json
  def index
    @webinars_positions = Webinars::Position.all
  end

  # GET /webinars/positions/1
  # GET /webinars/positions/1.json
  def show
  end

  # GET /webinars/positions/new
  def new
    @webinars_position = Webinars::Position.new
  end

  # GET /webinars/positions/1/edit
  def edit
  end

  # POST /webinars/positions
  # POST /webinars/positions.json
  def create
    @webinars_position = Webinars::Position.new(webinars_position_params)

    respond_to do |format|
      if @webinars_position.save
        format.html { redirect_to @webinars_position, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @webinars_position }
      else
        format.html { render :new }
        format.json { render json: @webinars_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webinars/positions/1
  # PATCH/PUT /webinars/positions/1.json
  def update
    respond_to do |format|
      if @webinars_position.update(webinars_position_params)
        format.html { redirect_to @webinars_position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @webinars_position }
      else
        format.html { render :edit }
        format.json { render json: @webinars_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webinars/positions/1
  # DELETE /webinars/positions/1.json
  def destroy
    @webinars_position.destroy
    respond_to do |format|
      format.html { redirect_to webinars_positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinars_position
      @webinars_position = Webinars::Position.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webinars_position_params
      params.require(:webinars_position).permit(:name)
    end
end
