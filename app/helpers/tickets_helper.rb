module TicketsHelper


  def more_than_six_tickets?(event_id, user_id, ticket_number)
    count = Ticket.where(user_id: user_id).where(event_id: event_id).sum('tickets_number')
    @current_sum = count
    count + ticket_number >= 6

  end

  def check_if_seat_taken(event_id)
   not_taken_seats = Ticket::SEATS
    Ticket::SEATS.each { |seat|
      ticket = Ticket.where(seat_id_seq: seat).where(event_id: event_id).take
      if !ticket.nil?
        not_taken_seats = not_taken_seats.delete(seat)
      end
    }

   not_taken_seats

  end


  def is_under_adult_age?(user_age, event_id)

    event = Event.where(id: event_id).take
    if event.for_adults
      return user_age < 18
    else
      return false
    end


  end

end
