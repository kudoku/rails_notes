class Note < ApplicationRecord
  belongs_to  :directory, optional: true

  scope :search, ->(param) { includes(:directory).where("name LIKE ?", ["%#{param}%"]) }

end