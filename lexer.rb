class Lexer < Formula
	desc "A library for lexing text, similar to flex for C/C++."
	homepage "https://github.com/Toberumono/Lexer"
	revision 4

	url "https://github.com/Toberumono/Lexer.git", :tag => "2.2"

	depends_on :java => "1.8+"
	depends_on "ant" => :build

	def install
		@jar_name="lexer.jar"
		system "ant", "-Dprefix=\"./\""
		ENV["LINK"] = ENV["LINK"] || ""
		lib.install "#{@jar_name}"
		if ENV["LINK"] != ""
			system "ln", "-sf", "#{HOMEBREW_PREFIX}/lib/#{@jar_name}", (ENV["LINK"] + "/#{@jar_name}")
		end
	end

	def caveats
		s = "\tIn order to use this library in a Java program, add #{HOMEBREW_PREFIX}/lib to your classpath.\n"
		if ENV["LINK"] != ""
			s += "\tMake sure to remove:\n"
			s += "\t" + ENV["LINK"] + "/#{@jar_name}\n"
			s += "\tif you uninstall this package - externally linked files cannot be tracked by homebrew."
			s
		end
	end