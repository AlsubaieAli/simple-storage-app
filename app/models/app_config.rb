class AppConfig < ApplicationRecord
  validates :storage_option, presence: true
  validates :local_storage_path, presence: true, if: :storage_option_local?
  after_validation :nullify_local_storage_path

  belongs_to :storage_option
  
  def is_local
    return false if self.storage_option.blank?
    self.storage_option.name == StorageOption::OPTIONS[:local]
  end
  
  private

    def nullify_local_storage_path
      unless is_local 
        self.local_storage_path = nil
      end
    end

    def storage_option_local?
      is_local
    end
end
