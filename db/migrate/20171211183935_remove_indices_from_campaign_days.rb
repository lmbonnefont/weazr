class RemoveIndicesFromCampaignDays < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaign_days, :irain, :float
    remove_column :campaign_days, :idamp, :float
    remove_column :campaign_days, :itemperature, :float
    remove_column :campaign_days, :idailyabsolute, :float
    remove_column :campaign_days, :idailyrelative, :float
  end
end
