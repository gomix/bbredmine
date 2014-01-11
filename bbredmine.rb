#!/usr/bin/ruby
#
# Usando rest-client

require 'rest-client'

# Configuración
#
# Redmines
# Necesitamos un arreglo de Redmine a los que conectarnos para recuperar las peticiones

class Redmine < RestClient::Resource
end

# Redmine.url 'http://gomix.fedora-ve.org/issues.xml?assigned_to_id=2&key=b899118d094e085b63658425dbba65629d619333'
