#!/usr/bin/ruby
#
# Programa que para reportar peticiones desde múltiples Redmines

# Ajustar más adelante bajo forma rubygem, ver ejemplo restclient binario de rest-client gem
$: << File.expand_path(File.dirname(".."))

require 'erb'
require '../lib/bbredmine/bbredmine.rb'

# Carga de la configuración
config = YAML.load_file('../config/bbredmine.yml')
redmines = []

# Instanciación de la configuración
config.each_pair { |key,values| 
  redmine = Redmine.new(apikey: values['apikey'], base_url: values['base_url'], name: key)
  redmines << redmine
}

# Imprimamos algo.
# Pero queremos plantillas para poder controlar mejor la presentación
#

redmines.each { |redmine|
  # url = "#{redmine.base_url}"
  #template_redmine_url = "Redmine: <%= url %>"
  #template_redmine_login_name = "Login Name: <%= login_name %>"
  
 # template1 = ERB.new template_redmine_url

  #template2 = ERB.new template_redmine_login_name

  #puts "URL: #{redmine.base_url}"
  #puts "Login name: #{redmine.redmine_login_name}"
  puts "-----------------------------------------"
  # p redmine.get_issues
  #puts template1.result 
  #puts template2.result

  # get_issues
  p redmine.issues
}
