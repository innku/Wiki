module Textile
  class Element
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    # Returns a new Element that will be presented in the Guide
    # You can pass a parser to the elements to be examined before doing textile
    #
    # === Examples:
    def initialize(example, &block)
      @example = example
      @parser = block
    end

    def display_textile
      content_tag :tr do
        content = content_tag :td, @example
        content += content_tag :td, representation.html_safe
      end
    end
    
    private

    def representation
      RedCloth.new(parse_element).to_html
    end

    def parse_element
      @parser ? @parser.call(@example) : @example
    end
  end

  class Guide
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def initialize(&block)
      @items = []
      instance_eval(&block)
    end

    def add(example, &block)
      @items << Element.new(example, &block)
    end

    def display
      content_tag :table, :id => "textile_guide" do
        content = table_headers
        @items.each { |i| content += i.display_textile }
        content
      end
    end

    private

    def table_headers
      content_tag :tr do
        row =  content_tag :th, "PARA OBTENER..."
        row += content_tag :th, "UTILIZA..."
      end
    end
  end
end
