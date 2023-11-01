class LocalStore < ApplicationRecord
  include SizeReader
  
  validates :path, :name, presence: true
  has_many :storage_records, as: :storable
  has_one_attached :file

  def self.create_file(path, name, data)
    new_record = self.new({path: path, name: name})
    if new_record.save    
      file_path = File.join(Rails.root, 'storage', path)
      FileUtils.mkdir_p(file_path) unless File.exist?(file_path)
      full_path_name = File.join(file_path, '/', name)
      blob = File.open(full_path_name, "wb") do |file|
        file.puts data
      end
      new_record.file.attach(blob)
      new_record.save
      new_record
    end
  end

  def data
    file_path = File.join(Rails.root, 'storage', self.path)
    full_path_name = File.join(file_path, '/', self.name)

    File.read(full_path_name).strip
  end
end
