json.extract! imagen, :id, :url, :sitio, :palabra, :created_at, :updated_at
json.url imagen_url(imagen, format: :json)
