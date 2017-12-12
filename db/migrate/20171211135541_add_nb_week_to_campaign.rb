class AddNbWeekToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :nbweek, :float
  end
end
