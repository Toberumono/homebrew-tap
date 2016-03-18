class Lexer < Formula
  desc "A library for lexing text, similar to flex for C/C++."
  @@jar_name="Lexer.jar"
  @@project_url="https://github.com/Toberumono/Lexer"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "5.1.0"

  head "#{@@project_url}.git"

  option "package-libraries", "Use this to force the libraries to be packaged inside the .jar file. This is not recommended"
  option "package-libs", "Equivalent to package-libraries"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "toberumono/tap/utils"
  depends_on "toberumono/tap/structures"

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
