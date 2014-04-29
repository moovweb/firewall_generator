require 'aws-sdk'

module FirewallGenerator
  module Input
    class Aws
      attr_accessor :options

      def initialize(options)
        @options = options
      end

      def ec2
        AWS::EC2.new(options)
      end

      def result
        all_public_ips.tap do |list|
          list.compact!
          list.uniq!
        end
      end

      private

      def all_public_ips
        [].tap do |list|
          AWS.memoize do
            ec2.regions.each do |region|
              region.instances.each do |instance|
                list << instance.public_ip_address
              end
            end
          end
        end
      end
    end
  end
end
