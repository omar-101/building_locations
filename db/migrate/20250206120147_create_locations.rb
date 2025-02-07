class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string 'country', null: false
      t.string 'city', null: false
      t.string 'area', null: false
      t.string 'street', null: false
      t.integer 'building_number', null: false
      t.string 'full_address', null: false
      t.timestamps
    end
  end
end
