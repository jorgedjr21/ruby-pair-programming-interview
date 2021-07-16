class CreateTenantRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :tenant_requests do |t|
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
