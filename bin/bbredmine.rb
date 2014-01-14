#!/usr/bin/ruby
#
# Programa que para reportar peticiones desde múltiples Redmines

# Ajustar más adelante bajo forma rubygem, ver ejemplo restclient binario de rest-client gem
$: << File.expand_path(File.dirname(".."))

require 'erb'
require './lib/bbredmine/bbredmine.rb'

# Carga de la configuración
config = YAML.load_file('./config/bbredmine.yml')
redmines = []

# Instanciación de la configuración
config.each_pair { |key,values|
  begin  
    redmine = Redmine.new(apikey: values['apikey'], base_url: values['base_url'], name: key)
    redmines << redmine
  rescue Exception => e
    puts "No se pudo instanciar Redmine : #{key}."
    puts e.message
  end  
}

# Imprimamos algo.
# Pero queremos plantillas para poder controlar mejor la presentación
#

redmines.each { |redmine|
  p redmine.issues
}
