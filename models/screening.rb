require_relative("../db/sql_runner")

class Screening

attr_reader :id
attr_accessor :film_id, :show_time

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @show_time = options["show_time"]
  end

  def save()
    sql = "INSERT INTO tickets
    (
    customer_id,
    film_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket["id"].to_i
  end
#
#   def update
#     sql = "UPDATE tickets SET
#     (
#     customer_id,
#     film_id
#     ) = (
#     $1, $2
#     )
#     WHERE id = $3"
#     values = [@customer_id, @film_id, @id]
#     SqlRunner.run(sql, values)
#   end
#
#   def delete
#     sql = "DELETE FROM tickets WHERE id = $1"
#     values = [@id]
#     SqlRunner.run(sql, values)
#   end
#
#   def self.all
#     sql = "SELECT * FROM tickets"
#     tickets = SqlRunner.run(sql)
#     return Ticket.map_items(tickets)
#   end
#
#   def self.map_items(ticket_data)
#     result = ticket_data.map { |ticket| Ticket.new(ticket) }
#     return result
#   end
#
#   def self.delete_all
#     sql = "DELETE FROM tickets"
#     SqlRunner.run(sql)
#   end
#
# end
