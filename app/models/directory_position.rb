class DirectoryPosition < ApplicationRecord
  belongs_to  :directory, foreign_key:  "directory_id"
  belongs_to  :directory, foreign_key:  "child_id"
end