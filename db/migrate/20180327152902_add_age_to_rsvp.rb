class AddAgeToRsvp < ActiveRecord::Migration[5.1]
  
  def change
    add_column :rsvps, :age, :integer
  end

end
