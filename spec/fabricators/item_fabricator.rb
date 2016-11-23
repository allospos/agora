Fabricator(:item) do
  user
  delivery_methods(count: 1)
  price            "350"
  title            "Couch"
  description      "Chair"
  condition        "New"
end
