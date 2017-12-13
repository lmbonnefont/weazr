class RemoveNameFromCampaigns < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :name, :string
  end
end
