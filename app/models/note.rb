class Note < ApplicationRecord
  belongs_to  :directory, optional: true
end