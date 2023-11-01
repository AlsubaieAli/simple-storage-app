class AppConfigsController < ApplicationController
  before_action :set_app_config, only: %i[ update ]

  # GET /app_configs
  def index
    @app_configs = AppConfig.first

    render json: @app_configs
  end

  # PATCH/PUT /app_configs/1
  def update
    if @app_config.update(app_config_params)
      render json: @app_config
    else
      render json: @app_config.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_config
      @app_config = AppConfig.first
    end

    # Only allow a list of trusted parameters through.
    def app_config_params
      params.require(:app_config).permit(:storage_option_id, :local_storage_path)
    end
end
