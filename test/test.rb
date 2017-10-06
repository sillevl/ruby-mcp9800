$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'mcp9800'

i2c = I2C.create '/dev/i2c-1'

tempsensor = Mcp9800::Mcp9800.new i2c

puts tempsensor.temperature
puts tempsensor.configuration


tempsensor.configuration = 0x60
