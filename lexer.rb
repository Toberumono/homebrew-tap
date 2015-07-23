class Lexer < Formula
	desc "A library for lexing text, similar to flex for C/C++."
	homepage "https://github.com/Toberumono/Lexer"
	revision 0

	url "https://github.com/Toberumono/Lexer.git", :using => :git, :tag => "Stable"

	version "2.1"

	option "with-prefix", "The root directory in which to download and compile the library [Default: ~/libraries/]"

	depends_on "ant" => :build

	def install
		opoo "with-prefix = #{with-prefix}"
		args = []
		if build.with? "prefix"
			args << "--Dprefix=#{with-prefix}"
		else
			args << "--Dprefix=~/libraries/"
		end
		system "ant", *args
	end
end