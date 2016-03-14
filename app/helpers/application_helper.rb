module ApplicationHelper
  def markdown(html)
    # This HTML class is provided in config/initializers/rouge.rb
    renderer = RecarpetHTML.new({
      filter_html: true,
      hard_wrap: true,
      prettify: true
    })

    extensions = {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      strikethrough: true
    }

    Redcarpet::Markdown.new(renderer, extensions).render(html).html_safe
  end

  def meta_tags_for_post_index
    { title: 'COSMIT Blog - Centro de Controle',
      description: 'Uma coleção das melhores ideias, histórias e experiências do nosso time',
      keywords: 'Centro de Controle, ideias, histórias, experiências',
      og: { url: posts_url,
            type: 'blog',
            title: 'COSMIT Blog - Centro de Controle',
            image: image_url('cosmit.jpg'),
            locale: 'pt_BR',
            site_name: 'cosmit.me',
            description: 'Uma coleção das melhores ideias, histórias e experiências do nosso time'
          },
      twiiter: {
        card: 'Centro de Controle',
        site: '@COSMITdev',
        description: 'Uma coleção das melhores ideias, histórias e experiências do nosso time',
        image: image_url('cosmit.jpg'),
        url: posts_url
      }
    }
  end

  def meta_tags_for_post(post)
    { title: "COSMIT Blog - "+post.meta_title,
      description: post.meta_description,
      keywords: post.meta_tags,
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
    { title: "COSMIT Trabalhos - Nossas experiências",
      description: 'Trabalhamos orientados a objetivos que geram resultados para o seu negócio',
      keywords: "Experiências, Objetivos, Negócio, MVP, Concierge, MVP Concierge, MVP V1, Desenvolvimento Contínuo, Pago Até, Tribo Viva, Enda, Aura, Let's Jam, Educais",
      og: { url: request.url,
            type: 'website',
            title: 'Nossos trabalhos e experiências',
            image: image_url('cosmit.jpg'),
            locale: 'pt_BR',
            site_name: 'cosmit.me',
            description: 'Trabalhamos orientados a objetivos que geram resultados para o seu negócio'
          },
      twiiter: {
        card: 'Nossos trabalhos e experiências',
        site: '@COSMITdev',
        description: 'Trabalhamos orientados a objetivos que geram resultados para o seu negócio',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_services
    { title: "COSMIT Serviços - Nossos Serviços",
      description: 'Somos um time de profissionais capazes de criar, lançar e impulsionar produtos digitais',
      keywords: "Serviços, Construção, Suporte & Manutenção, Suporte, Manutenção, Mentoria, Mentoria de Negócios, Desenvolvimento Contínuo, MVP, MVP V1, MVP Concierge, Manutenção Contínua, Emergência, Desempenho",
      og: { url: request.url,
            type: 'website',
            title: 'Nossos Serviços',
            image: image_url('cosmit.jpg'),
            locale: 'pt_BR',
            site_name: 'cosmit.me',
            description: 'Somos um time de profissionais capazes de criar, lançar e impulsionar produtos digitais'
          },
      twiiter: {
        card: 'Nossos serviços',
        site: '@COSMITdev',
        description: 'Somos um time de profissionais capazes de criar, lançar e impulsionar produtos digitais',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_home
    { title: 'COSMIT - Transformamos ideias em produtos de sucesso',
      description: 'A COSMIT é uma consultoria web que transforma ideias em produtos de sucesso',
      keywords: 'MVP, Concierge, MVP Concierge, MVP V1, Design, Desenvolvimento, Ideias, Validação, Suporte, Manutenção, Mentoria de Negócios',
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
