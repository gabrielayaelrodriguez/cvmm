# Preparando el ambiente para el correcto funcionamiento de la aplicación (Linux):

1. Clonar el trabajo mediante el siguiente comando:

```sh	
	$ git clone https://github.com/gabrielayaelrodriguez/cvmm.git
```

2. Posicionarse en la carpeta creada. Luego, instalar las dependencias necesarias corriendo el siguiente comando:

```sh
	$ bundle install
```

3. Correr las migraciones pendientes con el siguiente comando:

```sh	
	$ rails db:migrate
```
4. Luego, poblar la base de datos:

```sh
	$ rails db:seed
```

5. Levantar el servidor:

```sh
	$ rails s
```

# Ejecutando la aplicación

Se podrá ver la aplicación en http://localhost:3000/

ó en https://rocky-stream-87322.herokuapp.com/

# Corriendo los tests

## Tests de Modelos

Ejecutar en consola:

```sh
	$ rails test test/models/disk_test.rb
	$ rails test test/models/global_resource_test.rb
	$ rails test test/models/virtual_machine_test.rb
```

## Tests de Controladores

Ejecutar en consola:

```sh
	$ rails test test/controllers/admin/dashboard_controller_test.rb
	$ rails test test/controllers/admin/disks_controller_test.rb
	$ rails test test/controllers/admin/global_resources_controller_test.rb
	$ rails test test/controllers/admin/virtual_machines_controller_test.rb
```