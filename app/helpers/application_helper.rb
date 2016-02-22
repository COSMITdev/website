module ApplicationHelper
  def markdown(html)
    render_options = {
        # will remove from the output HTML tags inputted by user
        filter_html: true,
        # will insert <br /> tags in paragraphs where are newlines
        hard_wrap: true,
        # Prettify
        prettify: true
    }
    # This HTML class is provided in config/initializers/rouge.rb
    renderer   = HTML.new(render_options)
    extensions = {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      strikethrough: true
    }

    Redcarpet::Markdown.new(renderer, extensions).render(html).html_safe
  end

  def meta_tags_for_post(post)
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

  def meta_tags_for_works
    { title: "Cosmit - Trabalhos",
      description: 'Lorem ipsum',
      keywords: 'Lorem ipsum',
      og: { url: request.url,
            type: 'website',
            title: 'Lorem ipsum',
            image: image_url('cosmit.jpg'),
            locale: 'pt_BR',
            site_name: 'cosmit.me',
            description: 'Lorem ipsum'
          },
      twiiter: {
        card: 'Conheça nossos Cases!',
        site: '@COSMITdev',
        description: 'Lorem ipsum',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_home
    { title: 'COSMIT - Transformamos ideias em produtos de sucesso',
      description: 'A COSMIT é uma consultoria web que transforma ideias em produtos de sucesso',
      keywords: 'MVP, Concierge, Design, Desenvolvimento, Ideias, Validação, Suporte, Manutenção, Mentoria de Negócios',
      og: { url: request.url,
            type: 'website',
            title: 'A COSMIT é uma consultoria web que transforma ideias em produtos de sucesso',
            image: image_url('cosmit.jpg'),
            locale: 'pt_BR',
            site_name: 'cosmit.me',
            description: 'Somos uma equipe de experts apaixonados por resolver problemas através do design e da tecnologia'
          },
      twiiter: {
        card: 'Conheça nossos Cases!',
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end
end
