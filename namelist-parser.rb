class NamelistParser < Formula
  desc "A library for reading and writing WRF namelist files."
  @@jar_name="NamelistParser.jar"
  @@project_url="https://github.com/Toberumono/Namelist-Parser"
  homepage "#{@@project_url}"
  revision 6

  url "#{@@project_url}.git", :tag => "1.2"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "json-library"

  def install
    system "ant", "-Dprefix=\"./\"", "-Dlibs=\"#{HOMEBREW_PREFIX}/lib\""
    lib.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib to your classpath.
    EOS
  end
end
