Fabricator(:user) do
  username  "janedoe"
  password  "password"
  full_name "Jane Doe"
  email { sequence(:email) { |i| "janedoe1#{i}@allospos.io" } }
end
