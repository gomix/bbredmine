#!/usr/bin/ruby
#
# Programa que para reportar peticiones desde múltiples Redmines

# Ajustar más adelante bajo forma rubygem, ver ejemplo restclient binario de rest-client gem
$: << File.expand_path(File.dirname(".."))

require 'optparse'
require 'erb'
require '../lib/bbredmine/bbredmine.rb'

# Procesamiento de opciones en línea de comandos
options = {}
OptionParser.new do |opts|
    opts.banner = "Uso: bbredmine.rb [opciones]"
    opts.on("-h", "--help", "Ayuda en línea") do
    	puts opts
    	exit
    end

    options[:tabular] = false
    opts.on("-t", "--tabular", "Salida tabular de peticiones por redmine") do
      options[:tabular] = true
    end

    options[:lista] = false
    opts.on("-l", "--lista", "Salida tipo lista de peticiones") do
      options[:tabular] = true
    end

end.parse!

def init_redmines
  Redmine.load_config             # Carga de configuración 
  Redmine.init_redmines           # Instanciación de los redmines
end

def imprimir_tabular
  init_redmines
  Redmine.redmines.each { |redmine| p redmine.tabular }
end

def imprimir_peticiones
  init_redmines
  Redmine.redmines.each { |redmine| p redmine.list }
end


if options[:tabular] then 
  imprimir_tabular 
end
