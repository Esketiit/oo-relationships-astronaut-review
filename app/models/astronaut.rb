class Astronaut
    attr_accessor :name, :age, :specialty, :mars_missions
    @@all = []

    def initialize(name, age, specialty, mars_missions = 0)
        @name = name
        @age = age
        @specialty = specialty
        @mars_missions = mars_missions
        Astronaut.all << self
    end

    def self.all
        @@all
    end

    def shuttles
        Shuttle.all.select {|shuttle| shuttle.astronaut == self}
    end

    def join_shuttle(shuttle, launch_date)
        if shuttle.current_capacity > shuttle.capacity
            shuttle.passsengers << self
            self.mars_missions += 1
        else
            "This shuttle is a capacity!"
        end
    end

    def self.most_missions
        #Astronaut.all.sort {|x,y| x.mars_missions <=> y.mars_missions}[-1] 
        sorted_astronauts = Astronaut.all.sort_by {|astronaut| astronaut.mars_missions}
        sorted_astronauts[-1]
    end

    def create_by_shuttle(launch_date, shuttle)
        mission = Mission.new(launch_date, shuttle, self)
        mission
    end
end
