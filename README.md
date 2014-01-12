bbredmine
=========

Big Brother Redmine

Herramienta para reportar desde múltiples instancias Redmine. 

La necesidad inicial es tener una herramienta que permita consultar múltiples instancias Redmine para que el usuario se pueda ahorrar consultarlos manualmente y poder hacerse una idea clara de todas las peticiones que le están asignadas en ellos y poder tomar decisión de en cuál trabajar.

Autenticación
-------------

En las instancias Redmine debe estar habilitado el REST API Web Service, consulte al administrador para conseguir su llave API.
Se utilizará inicialmente autenticación de la forma:

> http://redmine.org/issues.xml?key=llaveapidelusario

_Note que si el tráfico desde/hacia su Redmine no está cifrado, esto es un riesgo de seguridad._

Pendiente evaluar otras opciones de autenticación soportadas

1. HTTP Basic auth ? http://login:password@redmine.org/issues.xml
2. HTTP Basic auth with API token and login ? http://login:RANDOM_KEY@redmine.org/issues.xml- (not supported yet)
3. HTTP Basic auth with API token ? http://RANDOM_KEY:X@redmine.org/issues.xml

Referencias
-----------

* http://www.redmine./projects/redmine/wiki/Rest_api
* https://github.com/rest-client/rest-client
