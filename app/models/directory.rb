class Directory < ApplicationRecord
  has_many :notes
  has_many  :children, class_name: 'Directory', foreign_key: :parent_id
  belongs_to  :parent, class_name: 'Directory', optional: true


  def create(params)
    directory = Directory.new(params) 
  end
end