module Mohawk
  module Accessors
    class Combo
      attr_reader :view

      def initialize(adapter, locator)
        @view = adapter.window.select_list(locator)
      end

      def value
        @view.value
      end

      def set(value)
        @view.select value if value.instance_of? Fixnum
        @view.set value if value.instance_of? String
      end

      def options
        @view.options.map &:text
      end
    end
  end
end
