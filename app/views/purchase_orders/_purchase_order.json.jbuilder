json.extract! purchase_order, :id, :description, :organization_id, :due_date, :user_id, :purchase_order_status_id, :supplier_id, :store_id, :created_at, :updated_at
json.url purchase_order_url(purchase_order, format: :json)
