module Minitest
  module Apidoc
    class Group
      attr_accessor :name, :endpoints

      def initialize(name, endpoints)
        @name = name || ""
        @endpoints = endpoints
      end

      # Takes a hash containing endpoint names as keys and endpoint objects as
      # values
      #
      # {"Widgets::Index" => #<Minitest::Apidoc::Endpoint>}, ...)
      #
      # and turns it into an array containing group objects so that the
      # endpoints whose group attribute is the same are put in the same group.
      #
      # [#<Minitest::Apidoc::Group>, ...]
      #
      # Sorts groups by name and endpoints within each group so that GETs are
      # first, then POSTs, PUTs, and so on. The template works with this array
      # to display the documentation.
      def self.from(endpoint_hash)
        # Drop if key/hash if no example_name
        binding.pry
        endpoint_hash.select! { |k, v| v.example_name != nil }
        sorted_endpoints = endpoint_hash.values.sort_by do |endpoint|
          Methods::VERBS.index(endpoint.request_method.downcase)
        end
        grouped_endpoints = sorted_endpoints.group_by { |endpoint| endpoint.group }
        groups = grouped_endpoints.map { |group, endpoints| Group.new(group, endpoints) }
        groups.sort_by(&:name)
      end
    end
  end
end
