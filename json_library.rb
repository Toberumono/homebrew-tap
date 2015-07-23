class JSON_Library < Formula
	desc "A library for parsing JSON text and reading and writing said text to and from files."
	homepage "https://github.com/Toberumono/JSON-Library"
	revision 0

	url "https://github.com/Toberumono/JSON-Library.git", :using => :git

	version "2.0"

	#option "prefix", "The root directory in which to download and compile the library [Default: ~/libraries/]"

	depends_on "ant" => :build

	def install
		system "ant", "-Dprefix=\"./\"", "-Dlibs=\"#{HOMEBREW_PREFIX}/lib\""
		lib.install "JSONLib.jar"
	end

	def caveats
		"In order to use this library in a Java program, add #{HOMEBREW_PREFIX}/lib to your classpath."
	end
end