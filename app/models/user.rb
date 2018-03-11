class User < ApplicationRecord
    belongs_to:company
    belongs_to:project #foreign key
    #:foreign key
end
