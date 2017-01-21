module TicketsHelper


  def more_than_six_tickets?(event_id, user_id, ticket_number)
    count = Ticket.where(user_id: user_id).where(event_id: event_id).sum('tickets_number')
    @current_sum = count
    count + ticket_number >= 6

  end

end
