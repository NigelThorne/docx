module Docx
  module Elements
    class Link
      include Element
      delegate :content, :content=, :to => :@node

      def self.tag
        'hyperlink'
      end

      def id
        @node.attributes["id"].value
      end

      def url
        @relationships.xpath("//*[@Id='#{id}']").find{|n| n.attributes.has_key?("Target")}.attributes["Target"].value
      end

      def initialize(node, relationships)
        @node = node
        @relationships = relationships
      end
    end
  end
end