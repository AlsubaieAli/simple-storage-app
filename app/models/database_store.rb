class DatabaseStore < ApplicationRecord
  include SizeReader

  validates :data, presence: true, uniqueness: {message: 'has already been saved'}
  
  has_many :storage_records, as: :storable
end
