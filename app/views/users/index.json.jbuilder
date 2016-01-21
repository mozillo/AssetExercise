json.array!(@users) do |user|
  json.extract! user, :id, :dept_uuid, :username, :uuid, :budget
  json.url user_url(user, format: :json)
end
