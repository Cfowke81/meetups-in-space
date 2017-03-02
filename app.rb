require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @events = Event.all

  erb :'meetups/index'
end

get '/meetups/new' do
  if session[:user_id].nil?
    flash[:notice] = "You must be signed in"
    redirect "/meetups"
  end
  erb :'meetups/new'
end

get '/meetups/:id' do
  @event = Event.find(params[:id])
  @attendees = @event.users

  erb :'meetups/show'
end

post '/meetups/new' do
  @event = Event.new({
    name: params[:name],
    description: params[:description],
    location: params[:location],
    creator: current_user.username
    })
  if @event.valid?
    @event.save
    flash[:notice] = "Event saved successfully!"
    redirect "/meetups/#{@event.id}"
  else
    flash[:notice] = "All fields must be filled in"
    redirect "/meetups/new"
  end
end

post '/meetups/:id' do
  if session[:user_id].nil?
    flash[:notice] = "You must be signed in to join event"
    redirect "/meetups/#{params[:id]}"
  elsif
    @add_attendee = Attendee.new({user_id: session[:user_id], event_id: params[:id]})
  elsif Attendee.exists?(@add_attendee.user_id)
    flash[:notice] = "You've already joined this event!"
    redirect "/meetups/#{params[:id]}"
  else @add_attendee.valid?
    @add_attendee.save
    flash[:notice] = "Successfully added to event!"
    redirect "/meetups/#{params[:id]}"
  end
  erb :'meetups/show'
end
