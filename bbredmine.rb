#!/usr/bin/ruby
#
# Usando rest-client

require 'rest-client'

# Configuración
#
# Redmines
# Necesitamos un arreglo de Redmine a los que conectarnos para recuperar las peticiones

class Redmine
  attr_accessor 'url'
  attr_accessor 'apikey'
end
