json.extract! pet, :id, :name, :breed, :date_of_birth, :created_at, :updated_at
json.url pet_url(pet, format: :json)
