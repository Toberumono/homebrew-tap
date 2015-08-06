class JsonLibrary < Formula
  desc "A library for parsing JSON text and reading and writing said text to and from files."
  @@jar_name="JSONLib.jar"
  @@project_url="https://github.com/Toberumono/JSON-Library"
  homepage "#{@@project_url}"
  revision 2

  url "#{@@project_url}.git", :tag => "2.4.3"

  head "#{@@project_url}.git"

  option "package-libraries", "Use this to force the libraries to be packaged inside the .jar file.  This is not recommended, but is available on the off-chance that it's needed at some point"
  option "package-libs", "Equivalent to package-libraries"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "toberumono/tap/lexer"
  depends_on "toberumono/tap/structures"
  depends_on "toberumono/tap/utils"

  def install
    args = ["-Duse.homebrew=true", "-Dbrew.path=#{HOMEBREW_PREFIX}/bin/brew"]
    if build.include? "package-libraries" or build.include? "package-libs"
      args << "-Dpackage.libs=true"
    end
    system "ant", "-Dprefix=./", *args
    lib.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib/#{@@jar_name} to your classpath.
    EOS
  end
end
