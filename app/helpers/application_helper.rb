module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(ImageReplacer, autolink: true, space_after_headers: true, fenced_code_blocks: true)
    @markdown.render(content).html_safe
  end
end

class ImageReplacer < Redcarpet::Render::HTML
  include Sprockets::Rails::Helper
  
  def image(link, alt_text, title)
    image = Image.find_by_name(link)
    image_tag image ? image.file.url : link, alt: alt_text, title: title, class: "img-responsive"
  end
end