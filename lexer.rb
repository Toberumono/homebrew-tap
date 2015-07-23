class Lexer < Formula
	desc "A library for lexing text, similar to flex for C/C++."
	homepage "https://github.com/Toberumono/Lexer"
	revision 8

	url "https://github.com/Toberumono/Lexer.git", :using => :git

	version "2.1"

	#option "prefix", "The root directory in which to download and compile the library [Default: ~/libraries/]"

	depends_on "ant" => :build
	depends_on :git => :build

	def install
		system "ant", "-Dprefix=\"./\""
		lib.install "lexer.jar"
	end
end