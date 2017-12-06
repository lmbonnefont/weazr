class CreateCampaignDays < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_days do |t|
      t.references :campaign, foreign_key: true
      t.date :date
      t.float :budget_forcast
      t.float :budget_spent

      t.timestamps
    end
  end
end
