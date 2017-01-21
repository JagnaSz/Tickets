class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = Ticket.where(user_id: current_user.id)
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @event = Event.where(id: @ticket.event_id).take
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.name = current_user.name + ' ' + current_user.last_name
    @ticket.age = current_user.age
    @ticket.email_address = current_user.email
    @events = Event.all
  end

  # GET /tickets/1/edit
  def edit
    @events = Event.all

  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    respond_to do |format|
      puts(@ticket.event_id)
      if more_than_six_tickets?(@ticket.event_id, current_user.id, @ticket.tickets_number)
        format.html { redirect_to new_ticket_url, :alert => "Nie możesz kupić więcej niż 5 biletów na to wydarzenie! Masz już #{@current_sum} biletów" }
        format.json { head :ok }
      else
        if @ticket.save
          format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|

      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:name, :seat_id_seq, :address, :price, :email_address, :phone, :age, :tickets_number, :event_id, :user_id)
  end
end
