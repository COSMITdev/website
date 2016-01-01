module ApplicationHelper
  def google_analytics_tacking_code(action)
    if action == 'mvp'
      ENV['ANALYTICS_MVP']
    elsif action == 'course'
      ENV['ANALYTICS_COURSE']
    else
      ENV['ANALYTICS_GENERAL']
    end
  end

  def markdown(html)
    # This HTML class is provided in config/initializers/rouge.rb
    renderer = RecarpetHTML.new({
      filter_html: false,
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
    { title: I18n.t('meta_tags.post.index.title'),
      description: I18n.t('meta_tags.post.index.description'),
      keywords: I18n.t('meta_tags.post.index.keywords'),
      url: posts_url,
      image: image_url('cosmit.jpg'),
      og: { url: posts_url,
            type: 'blog',
            title: I18n.t('meta_tags.post.index.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.post.index.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.post.index.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.post.index.twitter.card'),
        site: '@COSMITdev',
        description: I18n.t('meta_tags.post.index.twitter.description'),
        image: image_url('cosmit.jpg'),
        url: posts_url
      }
    }
  end

  def meta_tags_for_post(post)
    { title: "COSMIT Blog - "+post.meta_title,
      description: post.meta_description,
      keywords: post.meta_tags,
      url: posts_url,
      image: image_url('cosmit.jpg'),
      og: { url: post_url(post),
            type: 'blog',
            title: post.meta_title,
            image: post.hero_image.url(:hero),
            locale: I18n.t('meta_tags.post.show.og.locale'),
            site_name: 'cosmit.me',
            description: post.meta_description
          },
      twitter: {
        card: post.meta_title,
        site: '@COSMITdev',
        description: post.meta_description,
        image: post.hero_image.url(:hero),
        url: post_url(post)
      }
    }
  end

  def meta_tags_for_works
    { title: I18n.t('meta_tags.pages.works.title'),
      description: I18n.t('meta_tags.pages.works.description'),
      keywords: I18n.t('meta_tags.pages.works.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.pages.works.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.pages.works.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.pages.works.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.pages.works.twitter.card'),
        site: '@COSMITdev',
        description: I18n.t('meta_tags.pages.works.twitter.description'),
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_services
    { title: I18n.t('meta_tags.pages.services.title'),
      description: I18n.t('meta_tags.pages.services.description'),
      keywords: I18n.t('meta_tags.pages.services.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.pages.services.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.pages.services.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.pages.services.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.pages.services.twitter.card'),
        site: '@COSMITdev',
        description: I18n.t('meta_tags.pages.services.twitter.description'),
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_home
    { title: I18n.t('meta_tags.pages.home.title'),
      description: I18n.t('meta_tags.pages.home.description'),
      keywords: I18n.t('meta_tags.pages.home.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.pages.home.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.pages.home.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.pages.home.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.pages.home.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_mvp
    { title: I18n.t('meta_tags.pages.mvp.title'),
      description: I18n.t('meta_tags.pages.mvp.description'),
      keywords: I18n.t('meta_tags.pages.mvp.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.pages.mvp.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.pages.mvp.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.pages.mvp.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.pages.mvp.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_course
    { title: I18n.t('meta_tags.pages.course.title'),
      description: I18n.t('meta_tags.pages.course.description'),
      keywords: I18n.t('meta_tags.pages.course.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.pages.course.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.pages.course.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.pages.course.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.pages.course.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end
end
