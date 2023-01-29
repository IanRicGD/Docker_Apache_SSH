#Se obtiene la imagen de debian
FROM debian

#Se instala apache, ssh y otros paquetes que se utilizarán
RUN apt-get update && apt-get install -y \
    apache2 \ 
    openssh-server\
    systemctl \
    net-tools 

#Creción del usuario que utilizará los servicios
#Con el parametro -m se crea el directorio home al usuario y con -s para establecer el path a la shell del login del usuario

RUN useradd -ms /bin/bash user1

#Apache

# Se copia el contenido del sitio web creado previamente
COPY ./sitio_web/index.html /var/www/html/index.html

#SSH

# Creamos un directorio para las llaves ssh
RUN mkdir -p /home/user1/.ssh

# Copiamos la llave pública en el archivo "authorized_keys"
COPY public_key/key.pub /home/user1/.ssh/authorized_keys

# Asignamos los privilegios necesarios
RUN chmod 600 /home/user1/.ssh/authorized_keys && chown -R user1:user1 /home/user1/

# Corregimos el error "Missing privilege separation directory"
RUN mkdir /var/run/sshd


# Copiamos el script que se encargará de levantar los servicios
COPY apache-ssh-script /usr/local/bin/

# Le damos permisos de ejecución al script que levantará los servicios
RUN chmod +x /usr/local/bin/apache-ssh-script


#Exponiendo los puertos para ambos servicios
EXPOSE 80 22


# Ejecutamos el script que correrá los servicios
CMD ["apache-ssh-script"]






