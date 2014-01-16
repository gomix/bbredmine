require 'minitest'
module MiniTestAssertions
  def self.extended(base)
    base.extend(MiniTest::Assertions)
    base.assertions = 0
  end

  attr_accessor :assertions
end

World(MiniTestAssertions)

Dado(/^que el usuario teclea bin\/bbredmine\.rb \-h$/) do
  @cmd_output = `../bin/bbredmine.rb -h`
end 

Entonces(/^la salida debe mostrar:$/) do |expected|
  assert_equal(expected,@cmd_output)
end
