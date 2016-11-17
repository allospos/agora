Fabricator(:user) do
  username  { sequence(:username) { |i| "janedoe#{i}" } }
  password  "password"
  full_name "Jane Doe"
  email { sequence(:email) { |i| "janedoe1#{i}@allospos.io" } }
end
