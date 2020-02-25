class Mission
    attr_reader :launch_date, :shuttle, :astronaut
    @@all = []

    def initialize(launch_date, shuttle, astronaut)
        @launch_date = launch_date
        @shuttle = shuttle
        @astronaut = astronaut
        Mission.all << self
    end

    def self.all
        @@all
    end
end
