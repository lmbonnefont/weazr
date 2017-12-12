class AddInfoToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :budget_fb, :float
    add_column :campaigns, :target_age_min, :integer
    add_column :campaigns, :target_age_max, :integer
    add_column :campaigns, :post_msg, :string
    add_column :campaigns, :post_title, :string
  end
end
