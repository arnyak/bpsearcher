# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date(date)
      format = '%d/%m/%Y'
      return date.strftime(format)
  end; 
end
