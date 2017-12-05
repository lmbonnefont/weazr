class CreateInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :inputs do |t|
      t.float :monday
      t.float :tuesday
      t.float :wednesday
      t.float :thursday
      t.float :friday
      t.float :saturday
      t.float :sunday
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
