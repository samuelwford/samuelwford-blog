class RemoveAttachmentFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :file_file_name, :string
    remove_column :images, :file_content_type, :string
    remove_column :images, :file_file_size, :integer
    remove_column :images, :file_updated_at, :datetime
  end
end
