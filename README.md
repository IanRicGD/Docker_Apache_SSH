# Contenedor con Apache y SSH

El archivo DockerFile:
* Instala apache y ssh
* Genera un usuario para correr la aplicación
* Levanta los servicios de apache y ssh
* Copia el contenido de una página web (index.html) creada anteriormente visualizar el contenido

## Obtener la imagen

### Descargarla de DockerHub
```bash
docker pull ianrgd/apache_ssh:1.0
```

### Construirla con Docker
```bash
docker build -t username/project .
```
## Ejecutar el contenedor

### Sin usar volumenes
```bash
docker run -p 8080:80 -p 2222:22 <imagen:tag>
```

### Usando volumenes
```bash
docker run -v [FolderPath]:/var/www/html/ -p 8080:80 -p 2222:22 <imagen:tag>
```
En ese caso será necesario agregar en el FolderPath el archivo index.html que se mostrara con el servicio Apache, así como los demás recursos que se necesitaran para el sitio web.

## Comprobar el funcionamiento de los servicios

### Apache
Mandar un curl al localhost en el puerto 8080 con el comando:
```bash
curl localhost:8080
```

### SSH
Contando con la llave privada ejecutar:
```bash
ssh -p 2222 -i ./public_key/key user1@localhost
```
Posteriormente se solicitara la contraseña la cual es *docker*

## Archivos contenidos en GitHub
* DockerFile
	* Archivo con los comandos para crear la imagen de un contenedor basado en debian con Apache y SSH.

* sitio_web
	* Carpeta que contiene el archivo index.html

* public_key

	* Carpeta con las llave privada y pública para acceder al servicio de SSH con el usuario *user1*

* README.md
	* Documentación

## Links
* [DockerHub](https://hub.docker.com/repository/docker/ianrgd/apache_ssh/general "Title")
* [GitHub](https://github.com/IanRicGD/Docker_Apache_SSH "Title")
