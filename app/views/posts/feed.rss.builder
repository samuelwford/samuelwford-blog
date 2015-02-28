xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Samuel Ford"
    xml.description "Developer Ordinaire"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description markdown(post.body)
        xml.pubDate post.posted_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end