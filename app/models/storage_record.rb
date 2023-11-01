class StorageRecord < ApplicationRecord
  validates_associated :storable , :message=> lambda{|class_obj, obj| obj[:value].errors.full_messages.join(",") }
  
  belongs_to :storable, polymorphic: true
  
  def self.create_new_blob(data)
    app_config = AppConfig.eager_load(:storage_option).first
        
    case app_config.storage_option.name
    when StorageOption::OPTIONS[:database]
      new_storable = DatabaseStore.create({ data: data })
    when StorageOption::OPTIONS[:local]
      new_storable = LocalStore.create_file(
        app_config.local_storage_path,
        SecureRandom.uuid + '.txt',
        data
      )
    when StorageOption::OPTIONS[:aws]
    else
      raise 'No valid storage option detected'
    end

    self.new(storable: new_storable)
  end

end
