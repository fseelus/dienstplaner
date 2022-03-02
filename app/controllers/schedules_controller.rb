class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
    @shifts = @schedule.shifts
    @shift = Shift.new
    @floors = Floor.all
    @users = User.all
    @buildings = Building.all
  end


  private

    def set_shift
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
        params.require(:schedule).permit(:name, :employee_id, :creator_id)
    end

end
