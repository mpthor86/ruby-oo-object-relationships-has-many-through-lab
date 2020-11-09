class Doctor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def appointments
        Appointment.all.select {|app| app.doctor == self}
    end
    def new_appointment(date, name)
        Appointment.new(date, name, self)
    end
    def patients
        appointments.map {|app| app.patient}
    end
end