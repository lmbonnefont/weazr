class Add2InfoToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :url, :string
    remove_column :campaigns, :name
  end
end
