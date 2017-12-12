class CreateMeteos < ActiveRecord::Migration[5.1]
  def change
    create_table :meteos do |t|
      t.float :damp
      t.float :rain
      t.float :temperature
      t.date :date

      t.timestamps
    end
  end
end
