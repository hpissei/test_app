class Project < ApplicationRecord
    belongs_to:company
        has_many :works
        has_many :users, :through => :works
    validates:project_name,presence:true,length:{minimum:3},uniqueness:true
    validates:company_id,presence:true
    validates:default_rate,presence:true,numericality:{
                                            only_integer: true,
											 greater_than: 50,
											 less_than: 10000

    }

    def to_s
        "Project Name #{project_name} Company Id #{company_id} Default Rate #{default_rate}"
    end
end
