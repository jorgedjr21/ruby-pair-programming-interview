# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :check_tenant_api_key

  private

  def check_tenant_api_key
    tenant = Tenant.find_by(api_key: request.headers['Auth'])

    render json: { message: I18n.t("unauthorized") }, status: :unauthorized if tenant.blank?  
  end
end
