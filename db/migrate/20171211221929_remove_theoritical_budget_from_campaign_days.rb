class RemoveTheoriticalBudgetFromCampaignDays < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaign_days, :theorical_budget, :float
  end
end
