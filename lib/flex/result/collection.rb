module Flex
  class Result
    module Collection

      attr_reader :total_entries, :variables

      def setup(total_entries, variables)
        @total_entries = total_entries
        @variables     = variables
      end

      def per_page
        (@variables[:per_page] || @variables[:params] && @variables[:params][:size] || @variables[:size] || 10).to_i
      end

      def total_pages
        ( @total_entries.to_f / per_page ).ceil
      end

      def current_page
        if @variables[:page]
          @variables[:page].to_i
        else
          (per_page + (@variables[:from]||0).to_i) / per_page
        end
      end

      def previous_page
        current_page > 1 ? (current_page - 1) : nil
      end

      def next_page
        current_page < total_pages ? (current_page + 1) : nil
      end

      def offset
        per_page * (current_page - 1)
      end

      def out_of_bounds?
        current_page > total_pages
      end

      alias_method :limit_value,   :per_page
      alias_method :total_count,   :total_entries
      alias_method :num_pages,     :total_pages
      alias_method :offset_value,  :offset

    end
  end
end
