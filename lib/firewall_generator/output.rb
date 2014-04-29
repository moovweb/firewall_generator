require 'firewall_generator/output/template'

module FirewallGenerator
  module Output
    def self.new(output)
      klass = const_get(output[:type].capitalize)
      klass.new(output[:options])
    end
  end
end
