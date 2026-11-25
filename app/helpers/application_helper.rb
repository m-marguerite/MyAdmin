module ApplicationHelper
  # app/helpers/application_helper.rb
  def render_markdown(text)
    Kramdown::Document.new(text, input: 'GFM', syntax_highlighter: "rouge").to_html
  end
end
