require 'sinatra'
require 'haml'
require 'rdiscount'

get '/' do
  redirect '/home'
end

get '/home' do
  haml :home
end

get '/about' do
  markdown File.read("README.md")
end

get '/submission' do
  File.read("submission.txt")
end

post '/submit' do
  # just dump all the post data to a file...we'll parse it for the good stuff
  File.open("submission.txt", "a"){ |f| f.write(request.inspect) }
  redirect '/home'
end

__END__

@@ home
%h3 meddadada
%form{:action=>"/submit", :method=>"post" ,:enctype=>"multipart/form-data"}
  %input{:type=>"text", :name=>"submit"}
  %input{:type=>"submit", :value=>"submit"}
