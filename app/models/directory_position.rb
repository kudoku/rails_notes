class DirectoryPosition < ApplicationRecord
  belongs_to  :parent, class_name: 'Directory'
  belongs_to  :child, class_name: 'Directory'


  
end