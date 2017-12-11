class AddIndicesWeatherToCampaignDays < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_days, :irain, :float
    add_column :campaign_days, :idamp, :float
    add_column :campaign_days, :itemperature, :float
    add_column :campaign_days, :idailyabsolute, :float
    add_column :campaign_days, :idailyrelative, :float
  end
end
