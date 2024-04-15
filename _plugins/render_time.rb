module Jekyll
  class CollectionTag < Liquid::Tag
    def initialize(tag_name, collection_name, tokens)
      super
      @collection_name = collection_name.to_s.strip!
    end

    def render(context)
      super
      table = Hash.new
      collection = context["site.#{@collection_name}"]
      collection.each do |item|
        pth = String.new(item.relative_path)[/(?:_?projects\/)(?<foo>.*)/, :foo]
        table[pth] = item
      end

      context["col_#{@collection_name}"] = Hash[table]
    end
  end

  module ArrayToHashFilter
    def associate_by(arr, key)
      table = Hash.new
      arr.each do |item|
        table[item[key]] = item
      end
      return table
    end
  end

  class AddStylesheetTag < Liquid::Tag
    def initialize(tag_name, path, tokens)
      super
      @path = path.to_s.strip!
    end

    def render(context)
      super
      sheets = context["head.stylesheets"] || []
      sheets << @path
      context["head.stylesheets"] = sheets
    end
  end
end

Liquid::Template.register_tag('collection', Jekyll::CollectionTag)
Liquid::Template.register_filter(Jekyll::ArrayToHashFilter)

Liquid::Template.register_tag('add_stylesheet', Jekyll::AddStylesheetTag)

