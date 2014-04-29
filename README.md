# Firewall Generator

Simple plugin based firewall generation

## Installation

Install using:

    $ gem install firewall_generator

## Config

myconfig.yml

    ---
      :input:
        - :type: aws
          :options:
            :access_key_id: AKIAFOOBARFOOBAR
            :secret_access_key: aTasgWEGA/gwEGwageawseAGaGawegasEGAewgas
        - :type: aws
          :options:
            :access_key_id: AKIAFOOBARFOOBAR
            :secret_access_key: hWEgherhERHedrhdesrhAERG/.argaeagagswawe
      :output:
        - :type: template
          :options:
            :template: mytemplate.erb
            :output: output.rules

mytemplate.erb

    <% list.each do |item| %>
    -A INPUT -p tcp --dport 1234 -s <%= item %>/32 -j ACCEPT
    <% end %>

## Usage

    $ firewall_generator myconfig.yml
    $ cat output.rules
    -A INPUT -p tcp --dport 1234 -s 1.2.3.4/32 -j ACCEPT 
    -A INPUT -p tcp --dport 1234 -s 2.3.4.5/32 -j ACCEPT 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
