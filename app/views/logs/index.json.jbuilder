json.array!(@logs) do |log|
  json.extract! log, :id, :asset_manage_seq, :user_uuid, :admin_id, :action_type, :qty
  json.url log_url(log, format: :json)
end
