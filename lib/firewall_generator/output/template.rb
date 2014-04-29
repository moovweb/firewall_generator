require 'erb'

module FirewallGenerator
  module Output
    class Template
      attr_accessor :options, :list

      def initialize(options)
        @options = options
      end

      def template
        ERB.new(template_data, nil, "<>")
      end

      def result
        template.result(binding).tap do |result|
          File.open(options[:output], "w") do |f|
            f.write(result)
          end
        end
      end

      private

      def template_data
        File.read(options[:template])
      end
    end
  end
end
