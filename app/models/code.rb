require 'ss7'

class Code < ApplicationRecord
	extend Ss7
	
	def self.d2b(a)
		dec2bin(a)
	end
	def self.d2h(a)
		dec2hex(a)
	end
	def self.d2o(a)
		dec2oct(a)
	end
	def self.d2p(a)
		dec2pc77(a)
	end	
	def self.p2d(a)
		pc772dec(a)
	end
	def self.b2d(a)
		bin2dec(a)
	end
	def self.o2d(a)
		oct2dec(a)
	end
	def self.h2d(a)
		hex2dec(a)
	end	
	
	def self.name(b)
	  	convert = {d2b: "Decimal to Binary", d2h: "Decimal to Hexa", d2o: "Decimal to Octal",
    	d2p: "Decimal to 7-7 point code", p2d: "7-7 point code to decimal", b2d: "Binary to Decimal",
    	o2d: "Octal to Decimal", h2d: "Hexa to Decimal"}
	    return(convert[b])
	end

end
