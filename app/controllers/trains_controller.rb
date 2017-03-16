class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  def index
    @trains = Train.all
  end

  # GET /trains/1
  def show
    @sum_top_seat_pl = 0
    @sum_lower_seat_pl = 0
    @sum_top_seat_coupe = 0
    @sum_lower_seat_coupe = 0

    # counting_places('купе', @sum_top_seat_coupe, @sum_lower_seat_coupe)  
    @train.cars.where(car_type: 'купе').each do |car|
      @sum_top_seat_coupe += car.top_seat
      @sum_lower_seat_coupe += car.lower_seat
    end

    @train.cars.where(car_type: 'плацкарт').each do |car|
      @sum_top_seat_pl += car.top_seat
      @sum_lower_seat_pl += car.lower_seat
    end
    # counting_places('плацкарт', @sum_top_seat_pl, @sum_lower_seat_pl)
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: 'Train was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /trains/1
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Train was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /trains/1
  
  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Train was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id)
    end

    def counting_places(type_name, top_seat, lower_seat)
      @train.cars.where(car_type: type_name).each do |car|
        top_seat += car.top_seat
        lower_seat += car.lower_seat
      end
    end
end
