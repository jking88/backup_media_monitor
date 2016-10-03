json.extract! comment, :id, :username, :comment, :url, :created_at, :updated_at
json.url comment_url(comment, format: :json)