class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.new(event_params)
    if @event.save
    flash[:komunikat] = 'Event został poprawnie stworzony.'
    redirect_to events_path
    else
      render :action => "new"
    end
  end


  private

  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
  end

end
