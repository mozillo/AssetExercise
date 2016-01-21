json.array!(@user_budgets) do |user_budget|
  json.extract! user_budget, :id, :user_id, :admin_id, :budget_num, :budget_note
  json.url user_budget_url(user_budget, format: :json)
end
