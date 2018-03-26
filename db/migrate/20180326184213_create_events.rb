class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.integer :max_guests
      t.datetime :date
      t.string :description
      t.belongs_to :location
      t.belongs_to :user

      t.timestamps
    end
  end
end
