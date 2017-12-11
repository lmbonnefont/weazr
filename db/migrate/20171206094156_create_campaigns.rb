class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.references :company, foreign_key: true
      t.date :start
      t.date :end
      t.integer :budget_total
      t.integer :budget_remaining

      t.timestamps
    end
  end
end
