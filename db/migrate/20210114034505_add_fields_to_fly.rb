class AddFieldsToFly < ActiveRecord::Migration[6.1]
  def change
    add_column :flies, :departure_date, :datetime
    add_column :flies, :return_date, :datetime
    add_column :flies, :duration, :string 
  end
end
