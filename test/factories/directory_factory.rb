FactoryBot.define do
  
  factory :directory, class: 'Directory' do
    name {Faker::Company.buzzword}
    parent_id {}
  end
end