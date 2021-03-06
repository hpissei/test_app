class Company < ApplicationRecord
    has_many:users
    has_many:projects
    def to_s
        name
    end
    validates:name,presence:true,length:{minimum:3}

    def to_s
        "Company Name: #{name}"
    end
end
