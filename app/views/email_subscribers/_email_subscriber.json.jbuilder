json.extract! email_subscriber, :id, :name, :email, :list_name, :created_at, :updated_at
json.url email_subscriber_url(email_subscriber, format: :json)