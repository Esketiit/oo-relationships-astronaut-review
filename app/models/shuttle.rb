class Shuttle
    attr_reader :model
    attr_accessor :capacity, :passenegers, :current_capacity
    @@all = []

    def initialize(model, capacity)
        @model = model
        @capacity = capacity
        @current_capacity = 0
        @passenegers = []
        Shuttle.all << self
    end

    def add_astronaut(astronaut, launch_date)
        if @current_capacity <= @capacity
            self.passenegers << astronaut
            @current_capacity += 1
        else
            "Shuttles full"
        end
    end

    def current_astronauts
        @passenegers
    end

    def create_by_astronaut(astronaut, launch_date)
        Mission.new(launch_date, self, astronaut)
    end

    def self.find_by_model(model_number)
        Shuttle.all.find {|shuttle| shuttle.model == model_number}
    end

    def self.all
        @@all
    end

end
