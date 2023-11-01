class StorageRecordsController < ApplicationController
  before_action :set_storage_record, only: %i[ show destroy ]

  # GET /storage_records
  def index
    @storage_records = StorageRecord.all

    render json: @storage_records
  end

  # GET /storage_records/1
  def show
    render json: {
      id: @storage_record.id,
      data: @storage_record.storable.data,
      size: @storage_record.storable.size,
      created_at: @storage_record.created_at,
    }
  end

  # POST /storage_records
  def create
    data = params[:data]
    unless base64?(data)
      return render json: { message: 'Invalid base64 format'}, :status => :forbidden
    end

    @storage_record = StorageRecord.create_new_blob(data)

    if @storage_record.save
      render json: @storage_record, status: :created
    else
      render json: @storage_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /storage_records/1
  def destroy
    @storage_record.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_record
      @storage_record = StorageRecord.find(params[:id])
    end
end
