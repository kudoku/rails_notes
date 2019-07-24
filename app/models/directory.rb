class Directory < ApplicationRecord
  has_many :notes
  has_many  :descendents, class_name: 'DirectoryPosition', foreign_key: :parent_id
  has_many  :ancestors, -> { joins(:parent).where.not(level: 0).order(level: :desc) }, class_name: 'DirectoryPosition', foreign_key: :child_id
  belongs_to  :parent, class_name: 'Directory', optional: true

  after_create  :update_self_position
  after_create  :update_position

  def full_path
    self.ancestors.pluck("name").join('/') + "/#{self.name}"
  end

  def update_self_position
    DirectoryPosition.create(parent_id: self.id, child_id: self.id, level: 0) 
  end

  def update_position
    query = ActiveRecord::Base.sanitize_sql(["INSERT INTO directory_positions(parent_id, child_id, level)
      SELECT p.parent_id, c.child_id, p.level+c.level+1
      FROM directory_positions p, directory_positions c
      WHERE p.child_id=? AND c.parent_id=?", self.parent_id ,self.id])

    DirectoryPosition.connection.execute(query)
  end
end