class NamelistParser < Formula
  desc "A library for reading and writing WRF namelist files."
  @@jar_name="NamelistParser.jar"
  @@project_url="https://github.com/Toberumono/Namelist-Parser"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "2.0.1"

  head "#{@@project_url}.git"

  option "package-libraries", "Use this to force the libraries to be packaged inside the .jar file.  This is not recommended, but is available on the off-chance that it's needed at some point"
  option "package-libs", "Equivalent to package-libraries"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "toberumono/tap/json-library"

  def install
    args = ["-Duse.homebrew=true", "-Dbrew.path=#{HOMEBREW_PREFIX}/bin/brew"]
    if build.include? "package-libraries" or build.include? "package-libs"
      args << "-Dpackage.libs=true"
    end
    system "ant", "-Dprefix=./", *args
    lib.install "#{@@jar_name}"
  end

  def caveats
    <<-EOS.undent
      In order to reference #{@@jar_name} in a Java program,
      add #{HOMEBREW_PREFIX}/lib/#{@@jar_name} to your classpath.
    EOS
  end
end
