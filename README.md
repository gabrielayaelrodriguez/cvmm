## Preparando el ambiente de la aplicación (Linux):

1. Clonar el repositorio

```sh	
	$ git clone https://github.com/gabrielayaelrodriguez/cvmm.git
```

2. Posicionarse dentro del directorio e instalar dependencias

```sh
    $ cd cvmm
	$ bundle install
```

3. Correr migraciones

```sh	
	$ rails db:migrate
```
4. Poblar la base de datos

```sh
	$ rails db:seed
```

5. Levantar el servidor

```sh
	$ rails s
```

## Visualizando la aplicación

Se puede acceder a la aplicación mediante cualquiera de los siguientes links:

* http://localhost:3000/
* https://serene-badlands-23229.herokuapp.com/

## Estado por defecto de la aplicación luego de correr el seed

* El administrador es "admin@admin" con password "topsecret"
* Los recursos globales del sistema están inicializados en 0, modificables por el administrador
* Los usuarios deben registrarse para poder crear máquinas virtuales

## Corriendo los tests

### Tests de Modelos

```sh
	rails test test/models/disk_test.rb
	rails test test/models/global_resource_test.rb
	rails test test/models/virtual_machine_test.rb
```

### Tests de Controladores

* Tests de controladores de administrador:

```sh
	rails test test/controllers/admin/dashboard_controller_test.rb
	rails test test/controllers/admin/disks_controller_test.rb
	rails test test/controllers/admin/global_resources_controller_test.rb
	rails test test/controllers/admin/virtual_machines_controller_test.rb
```

* Tests de controladores de usuario:

```sh
	rails test test/controllers/user/dashboard_controller_test.rb
	rails test test/controllers/user/disks_controller_test.rb
	rails test test/controllers/user/virtual_machines_controller_test.rb
```