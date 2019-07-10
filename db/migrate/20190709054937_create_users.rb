class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.integer :number, :null => false
      t.date :date, :null => false
      t.string :description, :null => false
      
      t.timestamps
    end
  end
end
