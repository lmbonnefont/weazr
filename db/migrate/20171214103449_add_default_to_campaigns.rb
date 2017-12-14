class AddDefaultToCampaigns < ActiveRecord::Migration[5.1]
  def change
    change_column :campaigns, :budget_total, :integer, default: 0
  end
end
