class JsonLibrary < Formula
  desc "A library for parsing JSON text and reading and writing said text to and from files."
  @@jar_name="JSONLib.jar"
  @@project_url="https://github.com/Toberumono/JSON-Library"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "2.3.3"

  head "#{@@project_url}.git"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "lexer"
  depends_on "structures"

  def install
    system "ant", "-Dprefix=./", "-Duse.homebrew=true", "-Dbrew.path=#{HOMEBREW_PREFIX}/bin/brew"
    lib.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib to your classpath.
    EOS
  end
end
