require 'sinatra'
require 'dotenv'
require 'HTTParty'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load

class GithubSearchApp < Sinatra::Base
  get '/' do
    send_file 'index.html'
  end

  get '/githubsearch' do
    content_type :json
    HTTParty.get(compose_github_url, :verify => false).to_json
  end

  helpers do
    def compose_github_url
      "https://api.github.com/search/users?q=" + params[:search_term] + "&access_token=#{ENV['GITHUB_TOKEN']}"
    end
  end
end