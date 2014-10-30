class Todo < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :list
end
