module ApplicationHelper
  def full_title(page_title = nil)
    if page_title.present?
      "Summer Movie Game - #{page_title}"
    else
      "Summer Movie Game"
    end
  end
end
