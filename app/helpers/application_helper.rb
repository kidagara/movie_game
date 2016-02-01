module ApplicationHelper
  def full_title(page_title = nil)
    if page_title.present?
      "Movie Game - #{page_title}"
    else
      "Movie Game"
    end
  end
end
