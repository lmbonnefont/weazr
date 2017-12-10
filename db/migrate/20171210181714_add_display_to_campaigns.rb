class AddDisplayToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :display, :string
  end
end
