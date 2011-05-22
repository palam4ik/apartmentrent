module ApplicationHelper
  def page_title
    "Apartments: #{controller.action_name}"
  end
end
