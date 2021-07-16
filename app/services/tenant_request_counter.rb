class TenantRequestCounter
  attr_reader :tenant

  def initialize(tenant:)
    @tenant = tenant
  end

  def count_request
    return if @tenant.blank?

    tenant_request = TenantRequest.create(tenant_id: @tenant.id)
    tenant_request.save!
  end
end
