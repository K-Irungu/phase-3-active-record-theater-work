class Role < ActiveRecord::Base
    has_many :auditions
    
    def actors
        self.auditions.map { |audition| audition.actor }
    end

    def lcoations
        self.auditions.map { |audition| audition.location }
    end

    def lead
        lead = self.auditions.find { |audition| audition.hired == true } 
        lead ? lead : "no actor has been hired for this role"
    end

    def understudy
        understudy = self.auditions.map { |audition| audition.hired == true }[1]
        understudy ? understudy : "no understudy has been hired for this role"
    end
end