class Utils < Formula
  desc "A collection of utilities used throughout my libraries."
  @@jar_name="Utils.jar"
  @@project_url="https://github.com/Toberumono/Utils"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "1.2.1"

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
