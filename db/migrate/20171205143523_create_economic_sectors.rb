class CreateEconomicSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :economic_sectors do |t|
      t.float :damp
      t.float :rain
      t.float :temperature
      t.string :name
      t.float :sensitiveness

      t.timestamps
    end
  end
end
