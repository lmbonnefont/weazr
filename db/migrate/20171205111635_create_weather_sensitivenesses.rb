class CreateWeatherSensitivenesses < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_sensitivenesses do |t|
      t.float :damp
      t.float :temperature
      t.float :rain
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
