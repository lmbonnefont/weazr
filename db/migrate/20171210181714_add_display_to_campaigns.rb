class AddDisplayToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :display, :boolean, default: true
  end
end
