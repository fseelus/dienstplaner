class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]

  def index
    @shifts = Shift.all
    @users = User.all
    @shift = Shift.new


    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@shift.name} #{Date.today}",
        formats: :html,
        template: "shifts/pdf/_monthly_all"
      end
    end
  end

  def show
    # @shifts = Shift.where(employee_id:  @shift.employee_id)
    # to get a calendar starting in the same week as the shift
    @shifts = Shift.all_from_one_employee(@shift.employee_id)

    params[:start_date] = @shift.startdate.to_date

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@shift.name} #{Date.today}",
        formats: :html,
        template: "shifts/pdf/_weekly"
      end
    end
  end

  def new
    @shift = Shift.new
    @floors = Floor.all
    @users = User.all
    @buildings = Building.all

  end

  def edit
    @floors = Floor.all
    @users = User.all
    @buildings = Building.all
  end

  def create
  @shift = Shift.new(shift_params)

  respond_to do |format|
    if @shift.save
      format.html { redirect_to shift_url(@shift), notice: "Shift was successfully created." }
      format.json { render :show, status: :created, location: @shift }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @shift.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to shift_url(@shift), notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
  end
end

def destroy
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url, notice: "Dienstplan erfolgreich gelöscht." }
      format.json { head :no_content }
    end
  end

private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
      params.require(:shift).permit(:name, :startdate, :enddate, :floor_id, :bgcolor_id, :employee_id, :creator_id, :building_id)
  end
end
