require 'firewall_generator/input/aws'

module FirewallGenerator
  module Input
    def self.new(input)
      klass = const_get(input[:type].capitalize)
      klass.new(input[:options])
    end
  end
end
