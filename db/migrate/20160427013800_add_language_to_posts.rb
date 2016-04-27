class AddLanguageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :language, :string, default: 'pt-BR'
  end
end
