json.extract! user, :id, :name, :email, :password_digest, :profile_picture, :created_at, :updated_at
json.url user_url(user, format: :json)
