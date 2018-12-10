class FuelSuppliesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_fuel_supply, only: [:show, :edit, :update, :destroy]

  # GET /fuel_supplies/report
  def report
    @fuel_supplies = []
    if params[:search].present?
      search = params[:search]
      if search[:date_init].present? && search[:date_end].present?
        date_init = search[:date_init].to_date.strftime("%Y-%m-%d")
        date_end = search[:date_end].to_date.strftime("%Y-%m-%d")
        @fuel_supplies = policy_scope(FuelSupply.avg_per_period.search(date_init, date_end))
      end
    end
    authorize FuelSupply
  end

  # GET /fuel_supplies
  # GET /fuel_supplies.json
  def index
    @fuel_supplies ||= policy_scope(FuelSupply.all)
    authorize FuelSupply
  end

  # GET /fuel_supplies/1
  # GET /fuel_supplies/1.json
  def show
    authorize @fuel_supply
  end

  # GET /fuel_supplies/new
  def new
    @fuel_supply = FuelSupply.new
    authorize @fuel_supply
  end

  # GET /fuel_supplies/1/edit
  def edit
    authorize @fuel_supply
  end

  # POST /fuel_supplies
  # POST /fuel_supplies.json
  def create
    @fuel_supply = FuelSupply.new(fuel_supply_params)
    authorize @fuel_supply

    respond_to do |format|
      if @fuel_supply.save
        format.html { redirect_to @fuel_supply, notice: 'Fuel supply was successfully created.' }
        format.json { render :show, status: :created, location: @fuel_supply }
      else
        format.html { render :new }
        format.json { render json: @fuel_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuel_supplies/1
  # PATCH/PUT /fuel_supplies/1.json
  def update
    authorize @fuel_supply
    respond_to do |format|
      if @fuel_supply.update(fuel_supply_params)
        format.html { redirect_to @fuel_supply, notice: 'Fuel supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @fuel_supply }
      else
        format.html { render :edit }
        format.json { render json: @fuel_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuel_supplies/1
  # DELETE /fuel_supplies/1.json
  def destroy
    authorize @fuel_supply
    @fuel_supply.destroy
    respond_to do |format|
      format.html { redirect_to fuel_supplies_url, notice: 'Fuel supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel_supply
      @fuel_supply = FuelSupply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fuel_supply_params
      params.require(:fuel_supply).permit(:date_supply, :quantity, :price, :vehicle_id)
    end
end
