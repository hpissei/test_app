class AddDocToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :doc, :string
  end
end
