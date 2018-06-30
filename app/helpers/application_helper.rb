module ApplicationHelper

  # Included in application.html.erb to render the full title of each page.
  # The page_title variable is supplied ina a provide tage in each named HTML
  # page.
  def full_title(page_title='')
    main_title = "Jacob Daddario"
    if page_title.empty?
      main_title
    else
      "#{page_title} - #{main_title}"
    end
  end

end
