class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string:project_name
      t.integer:company_id
      t.integer:default_rate
      t.timestamps
      add_foreign_key :projects,:users #user id as fk in project  not working
    end
  end
end
