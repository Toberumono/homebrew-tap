class Utils < Formula
  desc "A collection of utilities used throughout my libraries."
  @@jar_name="Utils.jar"
  @@project_url="https://github.com/Toberumono/Utils"
  homepage "#{@@project_url}"
  revision 1

  url "#{@@project_url}.git", :tag => "1.5.6"

  head "#{@@project_url}.git"

  depends_on :java => "1.8+"
  depends_on "ant" => :build

  def install
    system "ant", "-Dprefix=./"
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
