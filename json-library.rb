class JsonLibrary < Formula
  desc "A library for parsing JSON text and reading and writing said text to and from files."
  @@jar_name="JSONLib.jar"
  @@project_url="https://github.com/Toberumono/JSON-Library"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "3.2.0"

  head "#{@@project_url}.git"

  option "package-libraries", "Use this to force the libraries to be packaged inside the .jar file. This is not recommended"
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
    doc.install Dir["doc/*"]
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib/#{@@jar_name} to your classpath.
      The documentation can be found in:
      #{HOMEBREW_PREFIX}/share/doc/#{name}
      run 'open #{HOMEBREW_PREFIX}/share/doc/#{name}/index.html'
      to view it in your default web browser.
    EOS
  end
end
