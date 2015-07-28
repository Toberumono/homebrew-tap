class Lexer < Formula
  desc "A library for lexing text, similar to flex for C/C++."
  @@jar_name="Lexer.jar"
  @@project_url="https://github.com/Toberumono/Lexer"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "2.2.1"

  head "#{@@project_url}.git"

  depends_on :java => "1.8+"
  depends_on "ant" => :build

  def install
    system "ant", "-Dprefix=\"./\""
    lib.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib to your classpath.
    EOS
  end
end
