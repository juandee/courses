# Sistema de administración de cursadas

## Versión de Ruby

	* ruby 2.4.1

## Dependencias del sistema

	* Git
	* Rails
	* Bundler
	* Postgresql

## Configuración del sistema 

El primer paso es clonar el repositorio a su máquina local utilizando el comando `git clone` y moverse al directorio del mismo.

```bash
	$ git clone https://github.com/juandee/courses
	$ cd courses
```

Una vez clonado el repositorio y estando situado en la carpeta del mismo, debemos instalar las gemas necesarias mediante el uso de `Bundler`.

```bash
	$ bundle
```

## Creación de la base de datos

Para la creación de la base de datos debemos ejecutar el siguiente comando:

```bash
	$ rake db:create
```

Al utilizar `postgresql` puede ser necesario definir credenciales, nombre de usuario y contraseña de `postgresql`. Esto no es necesario si ya existe un rol en postgresql con el nombre de nuestro usuario.
En caso de setearlo, se configura ingresando al archivo `config/database.yml`, donde se completa con los datos correspondientes las siguientes líneas:

```yml
	# ./config/database.yml

	username: "username" #nombre de su usuario postresql
  	password: "password" #nombre de su contraseña postgresql
```

Es posible que también requiere setear el `host`, que para correrlo localmente sería `locahost`, en el mismo archivo en el que seteó su usuario y contraseña:

```yml
	# ./config/database.yml

	host: localhost
```

Una vez creada la base de datos hay que ejecutar `rake db:seed` para cargar los datos:

```bash
	$ rake db:seed
```

## Puesta en marcha

Una vez ya instaladas las dependencias del proyecto y generada la base de datos, ya podrá poner en marcha el servidor, ejecutando:

```bash
	$ rails s
```

Una vez cargado el servidor ya podrá acceder a `http://loaclhost:3000`, donde se accede a la página de login del sitio, en donde deberá conocer el usuario y contraseña para poder ingresar.

## Tests

Para correr los tests se debe ejecutar el siguiente comando:

```bash
	$ rails test
```

Hay que tener en cuenta que al utilizar `postgresql` es necesario que el usuario de la base de datos tengo rol de `superuser`, ya que Rails deshabilita temporalmente la integridad referencial para borrar los datos de la base de datos y cargar los datos de los test. Esta acción será restringida por `postgresql` a menos que el usuario tenga rol `superuser`.
