include ApplicationHelper
class Wiki < ActiveRecord::Base

  belongs_to :user

  has_many :collaborations
  has_many :collaboration_users, through: :collaborations, :source => :user 

  def markdown_title
  markdown(self.title)
end

def markdown_body
  markdown(self.body)
end
end
