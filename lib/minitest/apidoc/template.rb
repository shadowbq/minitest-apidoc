require 'mustache'

module Minitest
  module Apidoc
    class Template < Mustache
      class << self
        attr_accessor :template_file, :output_file, :blurb, :footer
      end

      attr_reader :groups

      self.template_file = File.expand_path("../../template.mustache", File.dirname(__FILE__))
      self.output_file = "apidoc.html"
      self.footer = "This documentation was generated by minitest-apidoc #{Minitest::Apidoc::VERSION}."

      def initialize(groups)
        @groups = groups
      end

      def blurb
        self.class.blurb
      end

      def footer
        self.class.footer
      end

      def write
        File.open(self.class.output_file, "w") do |file|
          file.write(render)
        end
      end
    end
  end
end
