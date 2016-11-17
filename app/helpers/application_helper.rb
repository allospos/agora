module ApplicationHelper
  def markdown_render(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: false)
    @markdown.render(text).html_safe
  end
end
