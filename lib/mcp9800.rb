require "mcp9800/version"
require "i2c"

module Mcp9800
	class Mcp9800
		I2C_ADDRESS = 0x48

		module Registers
			AMBIENT_TEMPERATURE = 0x00
			CONFIGURATION = 0x01
		end

		def initialize i2c
			@i2c = i2c
		end

		def temperature
			value = read_short Registers::AMBIENT_TEMPERATURE
			(value / 256.0).round(1)
		end

		def configuration
			read_byte Registers::CONFIGURATION
		end

		def configuration= value
			write Registers::CONFIGURATION, value
		end

    private
    def read register, read_bytes = 1
	    @i2c.read I2C_ADDRESS , read_bytes , register
	  end

	  def read_byte register
		  data = read register
		  data.unpack("C").first
		end

		def read_short register
			data = read register, 2
			data.unpack("s>").first
		 end

		 def write register, *values
			 @i2c.write I2C_ADDRESS, register, *values
		 end
	end
end
