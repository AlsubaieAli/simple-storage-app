class AwsStore < ApplicationRecord
  has_many :storage_records, as: :storable
end
