class CreateWebinars < ActiveRecord::Migration[6.0]
  def change
    create_table :webinars do |t|
      t.string :title

      t.timestamps
    end
  end
end
