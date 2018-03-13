class Company < ApplicationRecord
    has_many:users
    has_many:projects
    def to_s
        name
    end
end
