class WrfRunner < Formula
  desc "A collection of structures used throughout my libraries."
  @@jar_name="WRFRunner.jar"
  @@project_url="https://github.com/Toberumono/WRF-Runner"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "1.0.1"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "namelist-parser"

  def install
    system "ant", "-Dprefix=\"./\"", "-Duse.homebrew=true"
    lib.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib to your classpath.
    EOS
  end
end
