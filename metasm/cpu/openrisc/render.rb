#    This file is part of Metasm, the Ruby assembly manipulation suite
#    Copyright (C) 2006-2009 Yoann GUILLOT
#
#    Licence is LGPL, see LICENCE in the top-level directory


require 'metasm/cpu/openrisc/opcodes'
require 'metasm/render'

module Metasm
class OpenRisc
	class Reg
		include Renderable
		def render ; ["r#@v"] end
	end

	class MemRef
		include Renderable
		def render
			r = []
			r << { 1 => 'byte ', 2 => 'word ', 4 => 'dword ', 8 => 'qword ' }[@msz]
			r << '['
			r << @base if @base
			r << '+' if @base and @offset
			r << @offset if @offset
			r << ']'
		end
	end
end
end
