class AddTheoricalBudgetToCampaignDays < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_days, :theorical_budget, :float
  end
end
