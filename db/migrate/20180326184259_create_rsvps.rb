class CreateRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvps do |t|
      t.belongs_to :event
      t.belongs_to :user

      t.timestamps
    end
  end
end
