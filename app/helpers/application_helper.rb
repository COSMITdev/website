module ApplicationHelper
  def markdown(html)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(html)
  end
end
