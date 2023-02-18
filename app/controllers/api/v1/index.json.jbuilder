json.pagination do
    json.current_page @microposts.current_page
    json.per_page @microposts.per_page
    json.total_entries @microposts.total_entries
  end

  json.microposts @microposts do |micropost|
    json.id micropost.id

    json.user do
      json.id micropost.user.id
      json.name micropost.user.name
    end

    json.content micropost.content
    json.created_at micropost.created_at
  end