# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table 	 :favorites do |t|
      t.integer 	 :favoritable_id
      t.string 		 :favoritable_type
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
