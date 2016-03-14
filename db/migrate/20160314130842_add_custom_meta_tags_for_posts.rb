class AddCustomMetaTagsForPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_tags, :string, null: false, default: ''

    Post.all.each do |post|
      post.update_attributes(meta_tags: post.tags.join(', '))
    end
  end
end
