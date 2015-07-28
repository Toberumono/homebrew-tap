class NamelistParser < Formula
  desc "A library for reading and writing WRF namelist files."
  @@jar_name="NamelistParser.jar"
  @@project_url="https://github.com/Toberumono/Namelist-Parser"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "1.2.2"

  head "#{@@project_url}.git"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "json-library"

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
