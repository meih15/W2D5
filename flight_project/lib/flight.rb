class Flight

    def initialize(flight_number, capacity) #string, number
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
       @passengers << passenger if !self.full? && passenger.has_flight?(@flight_number)
    end

    def list_passengers
       return passengers.map { |passenger| passenger.name }
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end