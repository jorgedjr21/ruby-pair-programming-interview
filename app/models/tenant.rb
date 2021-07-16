class Tenant < ApplicationRecord
  has_many :tenant_requests, dependent: :destroy
end
