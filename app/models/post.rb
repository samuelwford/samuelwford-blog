class Post < ActiveRecord::Base
  def posted_at_formatted
    posted_at.strftime('%B %e, %Y')
  end
end
