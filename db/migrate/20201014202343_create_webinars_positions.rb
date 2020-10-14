class CreateWebinarsPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :webinars_positions do |t|
      t.string :name

      t.timestamps
    end
  end
end
