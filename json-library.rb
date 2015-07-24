class JsonLibrary < Formula
	@@jar_name="JSONLib.jar"
	desc "A library for parsing JSON text and reading and writing said text to and from files."
	homepage "https://github.com/Toberumono/JSON-Library"
	revision 4

	url "https://github.com/Toberumono/JSON-Library.git", :tag => "2.3"

	depends_on :java => "1.8+"
	depends_on "ant" => :build
	depends_on "toberumono/tap/lexer"
	depends_on "toberumono/tap/additional-structures"

	def install
		system "ant", "-Dprefix=\"./\"", "-Dlibs=\"#{HOMEBREW_PREFIX}/lib\""
		ENV["LINK"] = ENV["LINK"] || ""
		lib.install "#{@@jar_name}"
		if ENV["LINK"] != ""
			system "ln", "-sf", "#{HOMEBREW_PREFIX}/lib/#{@@jar_name}", (ENV["LINK"] + "/#{@@jar_name}")
		end
	end

	def caveats
		s = "\tIn order to use this library in a Java program, add #{HOMEBREW_PREFIX}/lib to your classpath.\n"
		if ENV["LINK"] != ""
			s += "\tMake sure to remove:\n"
			s += "\t" + ENV["LINK"] + "/#{@@jar_name}\n"
			s += "\tif you uninstall this package - externally linked files cannot be tracked by homebrew."
			s
		end
	end
end
