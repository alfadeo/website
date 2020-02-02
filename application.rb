#configure :production, :development do
configure :development do
  $logger = Logger.new(STDOUT)
  enable :reloader
end

error do
  @error = request.env['sinatra.error']
  haml :error
end

not_found do
  redirect to('/')
end

get '/' do
  haml :main
end

get '/music/?' do
  @ids = File.read("./bandcamp.txt").split
  haml :music
end

get '/video' do
  @youtube = File.read("./youtube.txt").split
  @vimeo = File.read("./vimeo.txt").split
  haml :video
end

get '/pics' do
  haml :pics
end

get '/merch' do
  haml :merch
end
