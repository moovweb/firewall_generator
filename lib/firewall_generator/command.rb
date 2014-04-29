require 'yaml'

module FirewallGenerator
  class Command
    def initialize(args)
      @args = args
    end

    def config_file
      @args[0] || "config/application.yml"
    end

    def config
      YAML.load(config_data)
    end

    def inputs
      config[:input].collect do |input|
        Input.new(input)
      end
    end

    def outputs
      config[:output].collect do |output|
        Output.new(output)
      end
    end

    def run
      list = []
      inputs.each do |input|
        list += input.result
      end

      outputs.each do |output|
        output.list = list
        output.result
      end
    end

    private

    def config_data
      File.read(config_file)
    end
  end
end
