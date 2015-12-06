module Minitest
  module Apidoc
    class Endpoint
      attr_accessor :metadata, :params, :examples, :headers, :status_codes

      def initialize
        @metadata = {}
        @examples = []
        @params   = []
      end

      def headers_exist
        !(headers.empty?)
      end

      def params_exist
        !(params.empty?)
      end

      def html_anchor
        "#{@metadata[:request_method]}-#{@metadata[:request_path]}-#{@metadata.hash.abs}"
      end

      def html_class
        @metadata[:request_method].downcase
      end

      def method_missing(name, *args, &block)
        @metadata[name]
      end

      def respond_to?(name)
        @metadata.include?(name) || super
      end
    end
  end
end
