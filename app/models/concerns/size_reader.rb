module SizeReader
  def size
    base64 = self.data
    base64_string = base64.delete('=')
    bytes = base64_string.length * (3 / 4.to_f)
  
    bytes.to_i
  end
end