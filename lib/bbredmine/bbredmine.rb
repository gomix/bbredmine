#!/usr/bin/ruby
#
# Usando rest-client

require 'rest-client'
require 'json'
require 'yaml'
require 'erb'

# Clase derivada de RestClient::Resource para consultas al API REST de Redmine
class Redmine < RestClient::Resource
  attr_accessor 'name'
  attr_accessor 'base_url'
  
  def initialize(base_url: nil , apikey: nil, name: nil)
    @base_url = base_url.to_s
    @apikey = apikey.to_s
    @name = name.to_s
    super(base_url)
    set_current_user
  end

  def get_issues
    @url = @base_url + '/issues.json'
    get(:accept => :json ,
        :content_type => 'application/json', 
        :params => {:assigned_to_id => redmine_user_id, :key => @apikey})
  end

  def redmine_user_id
    JSON.parse(@current_user)['user']['id']
  end
  
  def redmine_login_name
    JSON.parse(@current_user)['user']['login']
  end

  def set_current_user
    @url = @base_url + '/users/current.json'
    @current_user = get(:params => {:key => @apikey})
  end

  def issues
    # Método inicial para imprimir en stdout
    issues = JSON.parse(get_issues)["issues"]
    dir = File.expand_path(File.join(File.dirname(__FILE__), "."))
    template = ERB.new(File.read(dir + "/issues.erb"),nil,"-")
    puts template.result(binding)
  end

  def total_issues
    JSON.parse(get_issues)["total_count"]
  end 
end
