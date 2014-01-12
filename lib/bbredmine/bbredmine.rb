#!/usr/bin/ruby
#
# Usando rest-client

require 'rest-client'
require 'json'
require 'yaml'

# Clase derivada de RestClient::Resource para consultas al API REST de Redmine
class Redmine < RestClient::Resource
  attr_accessor 'name'
  attr_accessor 'base_url'
  
  def initialize(base_url: nil , apikey: nil, name: nil)
    @base_url = base_url
    @apikey = apikey
    @name = name
    super(base_url)
    set_current_user
  end

  def get_issues
    @url = @base_url + '/issues.json'
    get(:params => {:assigned_to_id => redmine_user_id, :key => @apikey})
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
    # Método para imprimir en cli inicial
    issues = get_issues["issues"]
  end
end

#puts gomix_redmine.get(:params => { :key => 'b899118d094e085b63658425dbba65629d619333', :priority => 'urgent'})
