module EasyHead
  class AddStylesheetTag < Liquid::Tag
    LiquidName = 'add_stylesheet'

    def initialize(tag_name, path, tokens)
      super
      @path = path.to_s.strip!.undump
      @head_key = 'head'
      @key = 'stylesheets'
    end

    def render(context)
      @context = context
      page = @context.registers[:page]
      page[@head_key] ||= {}
      styles = page[@head_key][@key] ||= []
      styles << @path unless styles.include?(@path)
      nil
    end
  end

  class HeadDrop < Liquid::Drop
    include Jekyll::Utils

    LiquidName = 'easy_head'

    def initialize(payload)
      @payload = payload
    end

    def head
      @head ||= ['page', 'layout', 'site']
        .map! { |x| @payload[x]['head'] }
        .compact!
        .inject({}) do |acc, x | 
          deep_merge_hashes(acc, x)
        end
    end

    def stylesheets
      @stylesheets ||= head['stylesheets']
    end
  end

  module DefaultHeadPlugin
    module_function

    def default_head(page, payload)
      default_style_name = 'style.css'
      head = payload['page']['head'] ||= {}
      # is pre defined
      return if head.has_key?('stylesheets')

      # find file
      files = payload['site'].static_files
      default_style_url = Jekyll::PathManager.join(page.dir, default_style_name)
      return unless files.any? {|elem| elem.url == default_style_url }

      head['stylesheets'] ||= [default_style_name]
    end
  end

  Liquid::Template.register_tag(AddStylesheetTag::LiquidName, EasyHead::AddStylesheetTag)
  Jekyll::Hooks.register :pages, :pre_render do |page, payload|
    EasyHead::DefaultHeadPlugin::default_head(page, payload)
    payload[EasyHead::HeadDrop::LiquidName] = EasyHead::HeadDrop.new(payload)
  end
end

