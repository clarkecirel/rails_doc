class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    @appointments = current_patient.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @account.update(appointment_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
  end

  private
  def set_appointment
    @appointment = current_patient.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:type, :date, :time)  
  end
end
