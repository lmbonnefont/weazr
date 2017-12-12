class AddTitleToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :title, :string
  end
end
