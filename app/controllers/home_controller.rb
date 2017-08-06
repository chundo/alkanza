class HomeController < ApplicationController
  before_action :authenticate_user!
  require 'pry'

  def index
    @base_uri = JSON.load(open(%"https://www.googleapis.com/customsearch/v1?key=AIzaSyBjwXOLlY8-CPv_csamC9h5_N3lJr7P4Vw&cx=007331231350547501427:xk6qclo-fig&searchType=image&q=#{Palabra.all.sample.nombre}"))
    #@base_uri = JSON.load(open("q.json"))
  
  end

  def reportes
    if params[:palabra]
      @likes = Like.where(palabra: params[:palabra])
      @likes_f = JSON.load(open(%"https://alkanza-9b441.firebaseio.com/likes/#{params[:id]}.json"))

      @like_ma = Like.where(palabra: params[:palabra]).order(url: :desc).first
      @like_me = Like.where(palabra: params[:palabra]).order(url: :asc).last
    else
      @likes = Like.all
      @likes_f = JSON.load(open("https://alkanza-9b441.firebaseio.com/likes.json"))
      @like_ma = Like.order(url: :desc).first
      @like_me = Like.order(url: :asc).first#last
      #where(:user_id => current_user).order('finaliza desc')$
    end
  end

  def elegir
  	if params[:eleccion]
  		@like = Like.new(url: params[:eleccion], sitio: params[:sitio], palabra: params[:palabra], user_id: current_user.id)
  		@like.save

      base_uri = 'https://alkanza-9b441.firebaseio.com/'
      firebase = Firebase::Client.new(base_uri)
      response = firebase.push("likes", { url: params[:eleccion], sitio: params[:sitio], palabra: params[:palabra], user_id: current_user.id})
      #response.success? # => true
      #response.code # => 200
      #response.body # => { 'name' => "-INOQPH-aV_psbk3ZXEX" }
      #response.raw_body # => '{"name":"-INOQPH-aV_psbk3ZXEX"}'

  	end
  	redirect_to root_url
  end

  def resultados
  	if params[:username]
      if @usuario = User.find_by(:username => params[:username])
    		#@usuario = User.find_by(:email => params[:email])
    		@likes = Like.where(user_id: @usuario.id)
        @likes_f = JSON.load(open("https://alkanza-9b441.firebaseio.com/likes.json"))
        flash[:result] = %"Usuario tiene #{@likes.count}"
        flash[:color] = "success"
    	else
        flash[:result] = "No hay resultados de este usuario"
        flash[:color] = "danger"
    		@likes = Like.all
        @likes_f = JSON.load(open("https://alkanza-9b441.firebaseio.com/likes.json"))
    	end
    else
      @likes = Like.all
      @likes_f = JSON.load(open("https://alkanza-9b441.firebaseio.com/likes.json"))
    end
  end
end
