require 'rails_helper'

RSpec.describe TenantRequestCounter do
  let(:tenant) { create(:tenant) }
  
  describe 'Count the tenant request' do
    let(:tenant_request_counter) { TenantRequestCounter.new(tenant: tenant) }
    
    context '.count_request' do
      subject { tenant_request_counter.count_request }

      it 'must save the tenant request' do
        expect { subject }.to change(TenantRequest, :count).by(1)
      end
    end
  end
end
