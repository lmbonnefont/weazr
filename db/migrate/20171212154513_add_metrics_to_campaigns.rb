class AddMetricsToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :cpm, :string
    add_column :campaigns, :cpc, :string
    add_column :campaigns, :post_engagements, :string
    add_column :campaigns, :btn_click, :string
    add_column :campaigns, :impressions, :string
  end
end
