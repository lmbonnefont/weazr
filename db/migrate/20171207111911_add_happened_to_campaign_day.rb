class AddHappenedToCampaignDay < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_days, :happened, :boolean
  end
end
