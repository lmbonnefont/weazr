class AddIndicesToCampaignDays < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_days, :indice_rain, :float
    add_column :campaign_days, :indice_temperature, :float
    add_column :campaign_days, :indice_damp, :float
    add_column :campaign_days, :indice_daily, :float
  end
end
