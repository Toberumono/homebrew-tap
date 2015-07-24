class AdditionalStructures < Formula
	desc "A collection of structures used throughout my libraries."
	homepage "https://github.com/Toberumono/Additional-Structures"
	revision 3

	url "https://github.com/Toberumono/Additional-Structures.git", :tag => "1.2"

	depends_on :java => "1.8+"
	depends_on "ant" => :build

	def install
		system "ant", "-Dprefix=\"./\""
		lib.install "AdditionalStructures.jar"
	end

	def caveats
		"In order to use this library in a Java program, add #{HOMEBREW_PREFIX}/lib to your classpath."
	end
end