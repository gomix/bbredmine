require 'minitest/spec'
require 'minitest/autorun'
require 'webmock'
require './lib/bbredmine/bbredmine.rb'

include WebMock::API

# Issues (por ahora solo total_count => 25)
stub_request(:get, "http://gomix.proyectofedora.org/issues.json?assigned_to_id=368&key=34bc99e6e11e522e8812867e99cc26bef9f0eef0").with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => { "total_count" => "25"}.to_json , :headers => {'Content-Type'=>'application/json'})

# Current User 
stub_request(:get, "http://gomix.proyectofedora.org/users/current.json?key=34bc99e6e11e522e8812867e99cc26bef9f0eef0").with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body =>  {"user" => {"lastname" => "Echeverria","firstname" => "Eduardo", "mail" => "echevemaster@gmail.com", "last_login_on" => "2014/01/14 18:31:05 -0430", "created_on" => "2012/11/08 17:13:42 -0430", "id" => 368}}.to_json , :headers => {'Content-Type'=>'application/json'})


class TestRedmine < MiniTest::Unit::TestCase
  @@apikey = '34bc99e6e11e522e8812867e99cc26bef9f0eef0'
  @@base_url = 'http://gomix.proyectofedora.org'
  @@name = 'test-redmine'

  def setup
      @mi_redmine = Redmine.new(apikey: @@apikey, 
                                base_url: @@base_url, 
                                name: @@name)
    end

    def test_total_issues
      assert_equal "25", @mi_redmine.total_issues 
    end
end
