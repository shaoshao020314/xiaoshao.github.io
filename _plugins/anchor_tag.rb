module Jekyll
  class AnchoredHeaderTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      "<h4 id='#{@text}'><a name='#{@text}' class='noLink'>#{@text}</a></h4>"
    end
  end
end

Liquid::Template.register_tag('anchoredHeader', Jekyll::AnchoredHeaderTag)