class ChangePostMsginCampains < ActiveRecord::Migration[5.1]
  def change
    change_column :campaigns, :post_msg, :text
  end
end
