class AddUsualBudgetToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :usualbudget, :float
  end
end
