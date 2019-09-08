# frozen_string_literal: true

class Author < ApplicationRecord
	self.table_name  = 'authors'
	self.primary_key = 'id'

	has_many :books, :dependent => :destroy
end
