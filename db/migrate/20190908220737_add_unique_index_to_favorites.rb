# frozen_string_literal: true

class AddUniqueIndexToFavorites < ActiveRecord::Migration[5.2]
  def change
  	change_table :favorites do
  		add_index  :favorites, [:favoritable_id, :favoritable_type, :author_id],
  		unique: true, name: 'unique_favoritable_registers'
  	end
  end
end
