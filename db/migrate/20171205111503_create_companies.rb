class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
