# 'NilGuard':
#param_a ||= [cmd-line-val] || [config-file1-val] || [config-file2-val] || [default-val]
#param_b ||= [cmd-line-val] || [config-file-val] || [default-val]
#

require 'json'

class OurConfiguration
  attr_accessor :env, :user, :password, :debug, :verbose, :config_file
  
  def merge(configs=[])
    
    # for all the configurations,
      # apply this configuration for all the properites that I care about
    configs.each do |config|
      @env = config.env
      
    end
  end
end

ourconfig = OurConfiguration.new
ourconfig.env="dev"
ourconfig.user="dude"
ourconfig.password="password"
ourconfig.debug="True"
ourconfig.verbose="True"
ourconfig.config_file="configuration.json"


configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")

file_contents = File.read "#{configuration_root_dir}/configuration.json"

# load config data from json file
configuration_data = JSON.parse file_contents

# override default params with json config data
configuration_data.each do |key, value|
  puts "#{key}"
  
  value.each do |key2, value2|
    puts "\t#{key2}"
    
    value2.each do |key3, value3|
      ourconfig.key3 = value3
      puts "\t\t#{key3} --> \t#{value3}"
    end
    puts
  end
end
#puts configuration_data


# code to set defaults

#code to get_global_config_params
global_config_data.each do |key, value|
  ourconfig.key = value #if ourconfig.key
end

#code to get_cmd_line_params
  
