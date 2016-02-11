module ApplicationHelper
  def markdown(html)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(html)
  end

  def define_meta_tags_for_post(post)
    { title: "Cosmit Blog - "+post.meta_title,
      description: post.meta_description,
      keywords: post.tags.join(', '),
      og: { url: post_url(post),
            type: 'blog',
            title: post.meta_title,
            image: post.hero_image.url,
            locale: 'pt_BR',
            site_name: 'cosmit.me',
            description: @post.meta_description
          },
      twiiter: {
        card: @post.meta_title,
        site: '@COSMITdev',
        description: @post.meta_description,
        image: @post.hero_image.url,
        url: post_url(@post)
      }
    }
  end
end
