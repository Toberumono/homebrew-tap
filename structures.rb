class Structures < Formula
  desc "A collection of structures used throughout my libraries."
  @@jar_name="Structures.jar"
  @@project_url="https://github.com/Toberumono/Structures"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "1.2"

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
