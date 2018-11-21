# README

Se eligió utilizar la gema 'sideqik' para crear los waypoints de manera asincrónica.

Esta gema usa redis como base de datos.

Para que los jobs sean procesados hay que iniciar redis con el comando:
* redis-server

y luego iniciar sideqik con el comando:
* bundle exec sidekiq

Luego de esto se puede levantar el servidor con 'rails server' y empezar a  crear los waypoints.


