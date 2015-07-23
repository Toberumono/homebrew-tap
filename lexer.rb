class Lexer < Formula
	desc "A library for lexing text, similar to flex for C/C++."
	homepage "https://github.com/Toberumono/Lexer"
	revision 6

	url "https://github.com/Toberumono/Lexer.git", :using => :git, :tag => "Stable"

	version "2.1"

	#option "prefix", "The root directory in which to download and compile the library [Default: ~/libraries/]"

	depends_on "ant" => :build

	def install
		system "ant", "-Dprefix=./"
	end
end