json.extract! client, :id, :username, :email, :user_id, :created_at, :updated_at
json.url client_url(client, format: :json)
