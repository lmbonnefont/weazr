class AddPhotoToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :photo, :string
  end
end
