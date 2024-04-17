module EasyHead
  def if_file_exists(site, path)
    site.static_files.each do |file|
      return file if file.url == path
    end

    return false
  end

  class AddStylesheetTag < Liquid::Tag
    def initialize(tag_name, path, tokens)
      super
      @path = path.to_s.strip!
      @head_key = 'head'
      @key = 'stylesheets'
    end

    def render(context)
      @context = context
      page = @context.registers[:page]
      page[@head_key] ||= {}
      page[@head_key][@key] ||= []
      page[@head_key][@key] << @path
    end
  end

  class DefaultStylesheetGen < Jekyll::Generator
    include EasyHead

    @@default_path = 'style.css'

    def initialize(config)
      super
      @head_key ||= 'head'
      @stylesheets_key ||= 'stylesheets'
    end

    # if stylesheet is not specified and default exists, use default
    #   default is `style.css` relative to each page
    def generate(site)
      site.pages.each do |pg|
        # check if already defined
        if pg.data[@head_key] && !pg.data[@head_key][@stylesheets_key]&.empty?
          return
        end
        # check default
        default_style = Jekyll::PathManager.join(pg.dir, @@default_path)
        exists = !!if_file_exists(site, default_style)
        if exists
          # add_default
          pg.data[@head_key] ||= {}
          pg.data[@head_key][@stylesheets_key] = [default_style]
        end
      end
    end
  end
end

Liquid::Template.register_tag('add_stylesheet', EasyHead::AddStylesheetTag)

