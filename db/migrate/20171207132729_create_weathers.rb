class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.float :damp
      t.float :rain
      t.float :temperature
      t.references :campaign_day, foreign_key: true

      t.timestamps
    end
  end
end
