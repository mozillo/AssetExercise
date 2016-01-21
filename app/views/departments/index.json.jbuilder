json.array!(@departments) do |department|
  json.extract! department, :id, :department_name, :dept_uuid, :budget
  json.url department_url(department, format: :json)
end
