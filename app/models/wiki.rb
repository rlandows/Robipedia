include ApplicationHelper
class Wiki < ActiveRecord::Base

  belongs_to :user

  def markdown_title
  markdown(self.title)
end

def markdown_body
  markdown(self.body)
end
end
