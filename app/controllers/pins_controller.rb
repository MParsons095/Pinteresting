class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  #The default view (shows all pins)
  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  #The "show" view
  def show
    respond_with(@pin)
  end

  #The "new pin" view
  def new
    @pin = Pin.new
    respond_with(@pin)
  end

  #The edit view
  def edit
  end

  #The POST request from the "new pin" view
  def create
    @pin = Pin.new(pin_params)
    @pin.save
    respond_with(@pin)
  end

  #The POST request from the "edit" view
  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  #The destroy "POST" request
  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
