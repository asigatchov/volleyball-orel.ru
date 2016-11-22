json.extract! article, :id, :title, :content, :parent_id, :pos, :active, :created_at, :updated_at
json.url article_url(article, format: :json)