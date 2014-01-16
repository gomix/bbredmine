# language: es

Característica: Soporte de opciones de linea de comandos estilo POSIX
        Con la finalidad de poder seleccionar funcionalidad específica
	se debe soportar la capacidad de especificar dichas funcionalidades
	en la línea de comandos junto a sus argumentos.

Escenario: Ayuda en línea

	Dado que el usuario teclea bin/bbredmine.rb -h
	Entonces la salida debe mostrar:
"""
Uso: bbredmine.rb [options]
    -h, --help                       Ayuda en línea

"""
