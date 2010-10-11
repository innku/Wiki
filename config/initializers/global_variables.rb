if Rails.env.production?
  $like = "ILIKE"
else
  $like = "LIKE"
end