class Structures < Formula
  desc "A collection of structures used throughout my libraries."
  @@jar_name="Structures.jar"
  @@project_url="https://github.com/Toberumono/Structures"
  homepage "#{@@project_url}"
  revision 1

  url "#{@@project_url}.git", :tag => "1.2.5"

  head "#{@@project_url}.git"

  depends_on :java => "1.8+"
  depends_on "ant" => :build

  def install
    system "ant", "-Dprefix=./"
    lib.install "#{@@jar_name}"
    doc.install ["doc/index-files", "doc/toberumono"]
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib/#{@@jar_name} to your classpath.
      The documentation can be found in:
      #{HOMEBREW_PREFIX}/share/doc/namelist-parser/
    EOS
  end
end
