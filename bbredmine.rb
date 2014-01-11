#!/usr/bin/ruby
#
# Usando rest-client

require 'rest-client'
require 'json'

# Configuración
#
# Redmines
# Necesitamos un arreglo de Redmine a los que conectarnos para recuperar las peticiones
# Para identificar al usuario en el Redmine dado, solo se requiere el apikey de la combinación usuario/redmine específica

class Redmine < RestClient::Resource
  attr_accessor 'redmine_user_id'
  
  def initialize(base_url: nil , apikey: nil)
    @base_url = base_url
    @apikey = apikey
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

end

# Primer script de uso ejemplo
#gomix_redmine = Redmine.new(:apikey => 'b899118d094e085b63658425dbba65629d619333', :base_url => 'http://gomix.proyectofedora.org')

#gomix_redmine = Redmine.new 'http://gomix.proyectofedora.org/issues.json'
#ipostel_redmine = Redmine.new 'http://gomix.proyectofedora.org/issues.json'
#
#rpmdev_redmine = Redmine.new 'http://gomix.proyectofedora.org/issues.json'
#jordan_redmine = Redmine.new 'http://gomix.proyectofedora.org/issues.json'
#puts gomix_redmine.get(:params => { :key => 'b899118d094e085b63658425dbba65629d619333', :assigned_to_id => '2', :priority => 'urgent'})
