class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string:first_name
      t.string:last_name
      t.integer:company_id
      t.integer:project_id
      t.integer:work_id
      t.timestamps
    end
  end
end
