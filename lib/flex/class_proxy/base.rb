module Flex
  module ClassProxy
    class Base

      attr_accessor :variables

      def initialize(context, vars={})
        @variables = Variables.new({:context => context}.merge(vars))
      end

      def context
        variables[:context]
      end

      def context=(context)
        variables[:context] = context
      end

      def init; end

    end
  end
end
