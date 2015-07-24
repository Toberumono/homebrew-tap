class Lexer < Formula
	ARGV.each do|a|
		if a.length > 6 and a[0, 5] == "--dir"
			a = a[6..a.length]
			if a[0] == "\""
				a = a[1..a.length]
			end
			if a[-1] == "\"" and a[-2] != "\\"
				a = a[0..-2]
			end
			ENV["LINK"]=a
		end
	end
	@@jar_name="lexer.jar"
	desc "A library for lexing text, similar to flex for C/C++."
	homepage "https://github.com/Toberumono/Lexer"
	revision 6

	url "https://github.com/Toberumono/Lexer.git", :tag => "2.2"

	option "dir", "use --dir=\"<absolute path to folder>\" to create a hard link to the library in another location"

	depends_on :java => "1.8+"
	depends_on "ant" => :build
	depends_on "vim" => :optional

	def install
		system "ant", "-Dprefix=\"./\""
		libexec.install "#{@@jar_name}"
		if ENV["LINK"] != nil
			system "ln", "-sf", "#{HOMEBREW_PREFIX}/libexec/#{@@jar_name}", (ENV["LINK"] + "/#{@@jar_name}")
		end
	end

	def caveats
		s = "\tIn order to use this library in a Java program, add #{HOMEBREW_PREFIX}/libexec to your classpath.\n"
		if ENV["LINK"] != nil
			s += "\tMake sure to remove: " + ENV["LINK"] + "/#{@@jar_name}\n"
			s += "\tif you uninstall this package - externally linked files cannot be tracked by homebrew."
			s
		end
	end
end
