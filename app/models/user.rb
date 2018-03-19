Rails.application.config.active_record.belongs_to_required_by_default = false
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    belongs_to:company
    belongs_to :company
	has_many :works
	has_many :projects, :through => :works
end
