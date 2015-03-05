json.array!(@pictures) do |picture|
  json.extract! picture, :id, :caption, :description, :user_id, :album_id, :content_type, :width, :height
  json.url picture_url(picture, format: :json)
end
