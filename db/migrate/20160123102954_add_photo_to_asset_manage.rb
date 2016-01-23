class AddPhotoToAssetManage < ActiveRecord::Migration
  def up
    add_attachment :asset_manages, :photo
  end

  def down
    remove_attachment :asset_manages, :photo
  end
end
