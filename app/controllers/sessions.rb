class MakersBnB < Sinatra::Base

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thank you for visiting MakersBnB"
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/listings')
    else
      flash.now[:errors] = ['Invalid username or password']
      erb :'sessions/new'
    end
  end

  get '/listings' do
    erb :listings
  end
end
