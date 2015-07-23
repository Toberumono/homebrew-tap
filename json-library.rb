class JsonLibrary < Formula
	desc "A library for parsing JSON text and reading and writing said text to and from files."
	homepage "https://github.com/Toberumono/JSON-Library"
	revision 1

	url "https://github.com/Toberumono/JSON-Library.git", :using => :git, :tag => "Stable"

	version "2.0"

	depends_on "ant" => :build
	depends_on "toberumono/tap/lexer"
	depends_on "toberumono/tap/additional-structures"

	def install
		system "ant", "-Dprefix=\"./\"", "-Dlibs=\"#{HOMEBREW_PREFIX}/lib\""
		lib.install "JSONLib.jar"
	end

	def caveats
		"In order to use this library in a Java program, add #{HOMEBREW_PREFIX}/lib to your classpath."
	end
end