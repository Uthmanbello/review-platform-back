json.extract! facebook_review, :id, :full_name, :username, :review_text, :created_at, :updated_at
json.url facebook_review_url(facebook_review, format: :json)
