# frozen_string_literal: true

class Book < ApplicationRecord
	self.table_name  = 'books'
	self.primary_key = 'id'

	has_many   :favorites, as: :favoritable
  belongs_to :author
end
