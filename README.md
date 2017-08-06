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


---------------------------------------------------------------------------------------

API DE GOOGLE IMAGENES
API FIREBASE
SCAFFOLD CONTROLLER MODELOS
SESSION RAILS




AIzaSyBjwXOLlY8-CPv_csamC9h5_N3lJr7P4Vw




007331231350547501427:xk6qclo-fig














2 imagenes aleatorias tomadas de internet  y le permita al usuario seleccionar la que más le gusta

El usuario debe poder ingresar su nombre al inicio de la sesión y debe poder seleccionar tantas imágenes como quiera

se debe crear una aplicación paralela donde se puedan ver los resultados. 

Utilice Firebase como servicio de almacenamiento."

Entregable antes de la charla:
- Un sitio web con la implementación del problema
- Un enlace al codigo en github




























Rails.application.routes.draw do
  resources :likes
  resources :imagens
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'
  
  #get ':id' => 'home#index', :as => 'identificarme'
  post 'identificarme' => 'home#index', :as => 'identificarme'
  post 'elegir' => 'home#elegir', :as => 'elegir'
  post 'resultados' => 'home#resultados', :as => 'resultados'
  get 'resultados' => 'home#resultados'
  #get 'empleado/:id' => 'home#index', :as => 'identificarme'
  #post 'empleado/:id' => 'home#index'

  get 'buscar' => 'home/buscar'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



class HomeController < ApplicationController
  before_action :authenticate_user!


  def index
  	if params[:nombre]
  		@empleado = Empleado.find_by(:nombre => params[:nombre])
  		session[:current_empleado_id] = @empleado.id

		#session[:empleado_id] = @empleado.id
		#Empleado.find(session[:empleado_id])
		#session[:current_empleado_id] = @empleado.id
      	#redirect_to root_url
      	@current_empleado = Empleado.find_by_id(session[:current_empleado_id])
  	end

  	@current_empleado
  	@imagenes = Imagen.all
  end

  def buscar
  end

  def elegir
  	if params[:eleccion]
  		@like = Like.new(imagen_id: params[:eleccion], empleado_id: params[:empleado_id])
  		@like.save
  	end
  	redirect_to root_url
  end

  def resultados
  	if params[:nombre]
  		@empleado = Empleado.find_by(:nombre => params[:nombre])
  		@like = Like.where(empleado_id: @empleado.id)
  	else
  		@like = Like.all
  	end
  end


  def create
    if empleado = Empleado.authenticate(params[:nombre])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_empleado_id] = empleado.id
      redirect_to root_url
    end
  end

  def destroy
    # Remove the user id from the session
    @_current_empleado = session[:current_empleado_id] = nil
    redirect_to root_url
  end

end




<center><h1>Nivel de satisfacion</h1></center>


<% session.to_json %>

<center>
<% if @empleado or @current_empleado %>
  
  <h3><%= @current_empleado.nombre %> <%= @current_empleado.apellido %></h3>


  

  <% a = @imagenes.sample %>
  <% b = @imagenes.sample%>
  <% c = @imagenes.sample.methods %>

  <% if a == b %>
    <% b = @imagenes.sample %>
  <% end %>
 

  <img src="<%= a.url %>"><%=  link_to "A", elegir_path(eleccion: a.id, empleado_id: @empleado.id), method: :post %>
  <img src="<%= b.url %>"><%=  link_to "B", elegir_path(eleccion: b.id, empleado_id: @empleado.id), method: :post %>


<% else %>
  
  <%= form_tag(identificarme_path) do %>
    <%= text_field_tag :nombre, nil, :class => 'input-code', :placeholder => "Code" %>      
    <!-- hidden_field_tag :id, nil,:value => @causa.id -->                  
    <%= submit_tag('Identificarme', :class => 'btn btn-block btn-pink btn-primary playlist-caps') %>
  <% end %>

<% end %>
</center>




<%= form_tag(resultados_path) do %>
  <%= text_field_tag :nombre, nil, :class => 'input-code', :placeholder => "Code" %>      
    <!-- hidden_field_tag :id, nil,:value => @causa.id -->                  
  <%= submit_tag('Resultados', :class => 'btn btn-block btn-pink btn-primary playlist-caps') %>
<% end %>
<!--
<script>
  (function() {
    var cx = '007331231350547501427:xk6qclo-fig';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>



<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyAwPXVz9cl0HrsvqYoyiNSYtgA5EQp7dW0",
    authDomain: "alkanza-9b441.firebaseapp.com",
    databaseURL: "https://alkanza-9b441.firebaseio.com",
    projectId: "alkanza-9b441",
    storageBucket: "",
    messagingSenderId: "63628868626"
  };
  firebase.initializeApp(config);
</script>
-->




<h1>Resultados Generales</h1>


<%= form_tag(resultados_path) do %>
  <%= text_field_tag :nombre, nil, :class => 'input-code', :placeholder => "Code" %>      
    <!-- hidden_field_tag :id, nil,:value => @causa.id -->                  
  <%= submit_tag('Resultados', :class => 'btn btn-block btn-pink btn-primary playlist-caps') %>
<% end %>

<hr>
<% @like.each do |like|%>
	<%= like.imagen.url %><br>
	cantidad de voto  o usuarios que les gusto <br>
	usuarios que voraron por esta imagen<br>
	corresponder al % por ciento de los votos<br>
	<hr>
<% end %>





https://www.googleapis.com/customsearch/v1?key=AIzaSyBjwXOLlY8-CPv_csamC9h5_N3lJr7P4Vw&cx=007331231350547501427:xk6qclo-fig&searchType=image&q=Lo_Que_Sea







  <% @img = @imagenes.sample(2) %>  
  <% a = @img[0] %>  
  <% b = @img[1] %>

  <%=  link_to elegir_path(eleccion: a), method: :post do %>
    <img src="<%= a.url %>">
  <% end %>
  <%=  link_to elegir_path(eleccion: b), method: :post do %>
    <img src="<%= b.url %>">
  <% end %>