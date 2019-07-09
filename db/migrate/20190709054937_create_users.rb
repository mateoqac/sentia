class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :number
      t.date :date
      t.string :description
      
      t.timestamps
    end
  end
end
