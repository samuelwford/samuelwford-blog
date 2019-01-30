require 'redcarpet/render_strip'

module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(ImageReplacer, autolink: true, space_after_headers: true, fenced_code_blocks: true, tables: true)
    @markdown.render(content).html_safe
  end
  
  def plaintext(content)
    @plaintext ||= Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    @plaintext.render(content)
  end
end

class ImageReplacer < Redcarpet::Render::HTML
  include Sprockets::Rails::Helper
  
  def image(link, alt_text, title)
    image = Image.find_by_name(link)
    if image && image.picture.attached?
      image_tag make_url(image.picture), alt: alt_text, title: title, class: "img-responsive"
    else
      image_tag link, alt: alt_text, title: title, class: "img-responsive"
    end

    image_tag image ? make_url(image.picture) : link, alt: alt_text, title: title, class: "img-responsive"
  end

  private

  def make_url(attachment)
    Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true)
  end
end