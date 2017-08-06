# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Descripcion:
"La empresa donde trabajas quiere medir las preferencias gráficas de sus empleados. Para esto le han encargado la tarea de desarrollar una herramienta que haga esta medición. Desarrolle una aplicación que muestre 2 imágenes aleatorias tomadas de internet y le permita al usuario seleccionar la que más le gusta. El usuario debe poder ingresar su nombre al inicio de la sesión y debe poder seleccionar tantas imágenes como quiera. Adicionalmente, se debe crear una aplicación paralela donde se puedan ver los resultados. Utilice Firebase como servicio de almacenamiento."

Entregable antes de la charla:
- Un sitio web con la implementación del problema
- Un enlace al codigo en github


---------------------------------------------------------------------------------------


rails g controller Home index buscar elegir resultados
rails g devise User
rails g migration AddUsernameToUser username role
rails g scaffold Imagen url sitio palabra 
rails g scaffold Like imagen:references user:references 
rails g scaffold Like url sitio palabra user:references 








  <% @img = @imagenes.sample(2) %>  
  <% a = @img[0] %>  
  <% b = @img[1] %>

  <%=  link_to elegir_path(eleccion: a), method: :post do %>
    <img src="<%= a.url %>">
  <% end %>
  <%=  link_to elegir_path(eleccion: b), method: :post do %>
    <img src="<%= b.url %>">
  <% end %>
