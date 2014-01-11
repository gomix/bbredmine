bbredmine
=========

Big Brother Redmine

Herramienta para reportar desde múltiples instancias Redmine

Autenticación:

En las instancias Redmine debe estar habilitado el REST API Web Service, consulte al administrador para conseguir su llave API.
Se utilizará inicialmente autenticación de la forma:

1. Full token auth ? http://redmine.org/issues.xml?key=RANDOM_KEY

Ejemplo para usuario gomix:

# http://gomix.sample.com/issues.json?assigned_to_id=2&key=<your-api-key>

Pendiente evaluar otras opciones de autenticación soportadas

1. HTTP Basic auth ? http://login:password@redmine.org/issues.xml
2. HTTP Basic auth with API token and login ? http://login:RANDOM_KEY@redmine.org/issues.xml- (not supported yet)
3. HTTP Basic auth with API token ? http://RANDOM_KEY:X@redmine.org/issues.xml
