class AddIndiceToCampaignDays < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_days, :indice_bau, :float
  end
end
