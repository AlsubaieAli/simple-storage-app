class StorageOptionsController < ApplicationController
  # GET /storage_options
  def index
    @storage_options = StorageOption.all

    render json: @storage_options
  end
end
