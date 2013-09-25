module ApplicationHelper
  def parse_markdown(markdown_string)
    Kramdown::Document.new(h(markdown_string)).to_html.html_safe
  end

  def bootstrap_flash_type(conventional_type)
    {notice: 'success', alert: 'danger'}[conventional_type.to_sym]
  end

  def user_flash_type(conventional_type)
    {notice: 'Success', alert: 'Warning'}[conventional_type.to_sym]
  end
end
