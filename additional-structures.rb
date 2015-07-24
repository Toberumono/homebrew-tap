class AdditionalStructures < Formula
	desc "A collection of structures used throughout my libraries."
	homepage "https://github.com/Toberumono/Additional-Structures"
	revision 3

	url "https://github.com/Toberumono/Additional-Structures.git", :tag => "1.2"

	depends_on :java => "1.8+"
	depends_on "ant" => :build

	def install
		@jar_name="AdditionalStructures.jar"
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
end
