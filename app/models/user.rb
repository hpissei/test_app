Rails.application.config.active_record.belongs_to_required_by_default = false
class User < ApplicationRecord
    belongs_to:company
    belongs_to :company
	has_many :works
	has_many :projects, :through => :works
end
