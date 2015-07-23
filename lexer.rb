class Lexer < Formula
	desc "A library for lexing text, similar to flex for C/C++."
	homepage "https://github.com/Toberumono/Lexer"
	revision 2

	url "https://github.com/Toberumono/Lexer.git", :using => :git, :tag => "2.2"

	depends_on "ant" => :build

	def install
		system "ant", "-Dprefix=\"./\""
		lib.install "lexer.jar"
	end

	def caveats
		"In order to use this library in a Java program, add #{HOMEBREW_PREFIX}/lib to your classpath."
	end
end