FactoryBot.define do
  
  factory :note do
    name {Faker::Company.bs}
    note_text {Faker::Company.bs}
    directory_id {}
  end
end