class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.integer:project_id
      t.integer:user_id
      t.date:date_performed
      t.timestamps
    end
  end
end
