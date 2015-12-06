module Minitest
  module Apidoc
    class Reporter < Minitest::Reporter
      class << self
        attr_accessor :enable_plugin
      end

      def initialize
        @endpoints = {}
        @tests = []
      end

      def record(test)

        begin
          test.last_response #assert a RackTest

          if @tests.last.class != test.class
            @endpoints[test.class] = Endpoint.new
            @endpoints[test.class].metadata = test.class.metadata
            @endpoints[test.class].params = test.class.params
            @endpoints[test.class].headers = test.class.headers

            if (test.last_request.body.string == "") || (test.last_request.body.string == nil)
              request_body = false
            else
              request_body = test.last_request.body.string
            end

            # Check if test had a defined status code
            if !(test.class.status_codes.first.nil?) && test.class.status_codes.first.has_key?(:code)
                @endpoints[test.class].status_codes = test.class.status_codes
            else
              # No defined code, use the passed test code.
                if !(@endpoints.first[1].metadata.empty?)
                  @endpoints[test.class].status_codes = [{:code => test.last_response.status}]
                end
            end
          end

          if test.passed? && test.class.metadata[:request]
            require 'pry'
            binding.pry
            @endpoints[test.class].examples << {
              :title    => test.class.metadata[:example_name],
              :request  => test.class.metadata[:request],
              :request_body  => request_body,
              :response => CodeRay.scan(test.class.metadata[:response], :JSON).div
            }
          end
        rescue Rack::Test::Error => e
          # print '*'
        end
        @tests << test

      end

      def passed?
        groups = Group.from(@endpoints)
        Template.new(groups).write
      end
    end
  end
end
