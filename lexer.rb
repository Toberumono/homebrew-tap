class Lexer < Formula
  desc "A library for lexing text, similar to flex for C/C++."
  @@jar_name="lexer.jar"
  @@project_url="https://github.com/Toberumono/Lexer"
  homepage "#{@@project_url}"
  revision 8

  url "#{@@project_url}.git", :tag => "2.2"

  depends_on :java => "1.8+"
  depends_on "ant" => :build

  def install
    system "ant", "-Dprefix=\"./\""
    libexec.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/libexec to your classpath.
    EOS
  end
end
