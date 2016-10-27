module ApplicationHelper
  def google_tag_manager
    ENV['GOOGLE_TAG_MANAGER']
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
        url: post_url(post),
        card: 'summary_large_image',
        site: '@COSMITdev',
        title: post.meta_title,
        image: post.hero_image.url(:hero),
        description: post.meta_description
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

  def meta_tags_for_error
    { title: I18n.t('meta_tags.pages.error.title'),
      description: I18n.t('meta_tags.pages.error.description'),
      keywords: I18n.t('meta_tags.pages.error.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.pages.error.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.pages.error.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.pages.error.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.pages.error.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_startups
    { title: I18n.t('meta_tags.startups.index.title'),
      description: I18n.t('meta_tags.startups.index.description'),
      keywords: I18n.t('meta_tags.startups.index.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.startups.index.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.startups.index.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.startups.index.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.startups.index.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_call
    { title: I18n.t('meta_tags.startups.call.title'),
      description: I18n.t('meta_tags.startups.call.description'),
      keywords: I18n.t('meta_tags.startups.call.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.startups.call.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.startups.call.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.startups.call.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.startups.call.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_mvpconcierge
    { title: I18n.t('meta_tags.startups.concierge.title'),
      description: I18n.t('meta_tags.startups.concierge.description'),
      keywords: I18n.t('meta_tags.startups.concierge.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.startups.concierge.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.startups.concierge.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.startups.concierge.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.startups.concierge.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_mvpslim
    { title: I18n.t('meta_tags.startups.mvp.title'),
      description: I18n.t('meta_tags.startups.mvp.description'),
      keywords: I18n.t('meta_tags.startups.mvp.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.startups.mvp.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.startups.mvp.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.startups.mvp.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.startups.mvp.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_course
    { title: I18n.t('meta_tags.startups.course.title'),
      description: I18n.t('meta_tags.startups.course.description'),
      keywords: I18n.t('meta_tags.startups.course.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.startups.course.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.startups.course.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.startups.course.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.startups.course.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_quiz1
    { title: I18n.t('meta_tags.quizzes.quiz1.title'),
      description: I18n.t('meta_tags.quizzes.quiz1.description'),
      keywords: I18n.t('meta_tags.quizzes.quiz1.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.quizzes.quiz1.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.quizzes.quiz1.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.quizzes.quiz1.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.quizzes.quiz1.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end

  def meta_tags_for_protocamp
    { title: I18n.t('meta_tags.protocamp.index.title'),
      description: I18n.t('meta_tags.protocamp.index.description'),
      keywords: I18n.t('meta_tags.protocamp.index.keywords'),
      url: request.url,
      image: image_url('cosmit.jpg'),
      og: { url: request.url,
            type: 'website',
            title: I18n.t('meta_tags.protocamp.index.og.title'),
            image: image_url('cosmit.jpg'),
            locale: I18n.t('meta_tags.protocamp.index.og.locale'),
            site_name: 'cosmit.me',
            description: I18n.t('meta_tags.protocamp.index.og.description')
          },
      twitter: {
        card: I18n.t('meta_tags.protocamp.index.twitter.card'),
        site: '@COSMITdev',
        description: '',
        image: image_url('cosmit.jpg'),
        url: request.url
      }
    }
  end
end
