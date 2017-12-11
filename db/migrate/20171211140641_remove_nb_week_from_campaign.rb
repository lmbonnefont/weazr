class RemoveNbWeekFromCampaign < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :nbweek, :float
  end
end
