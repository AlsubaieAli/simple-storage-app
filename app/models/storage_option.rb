class StorageOption < ApplicationRecord
  OPTIONS = {
    :database => 'database',
    :local => 'local',
    :aws => 'aws'
  }
  OPTIONS.freeze
  OPTIONS.values.each{ |v| v.freeze }
end
