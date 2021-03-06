class WrfRunner < Formula
  desc "A script for automatically running WRF and WPS models."
  @@jar_name="WRFRunner.jar"
  @@project_url="https://github.com/Toberumono/WRF-Runner"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "7.4.4"

  head "#{@@project_url}.git"

  devel do
    url "#{@@project_url}.git", :branch => "develop"
  end

  option "with-fresh-configuration", "Use this to wipe your existing configuration"
  option "with-fine-logging", "Use this to set the logging level to fine"
  option "package-libraries", "Use this to force the libraries to be packaged inside the .jar file. This is not recommended"
  option "package-libs", "Equivalent to package-libraries"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "toberumono/tap/namelist-parser"
  depends_on "toberumono/tap/json-library"
  depends_on "toberumono/tap/structures"
  depends_on "toberumono/tap/utils"

  def install
    args = ["-Duse.homebrew=true", "-Dbrew.path=#{HOMEBREW_PREFIX}/bin/brew"]
    if build.include? "package-libraries" or build.include? "package-libs"
      args << "-Dpackage.libs=true"
    end
    system "ant", "-Dprefix=./", *args
    lib.install "#{@@jar_name}"
    if !(etc/"wrf-runner").exist?
      mkdir_p etc/"wrf-runner"
    end
    if build.with? "fresh-configuration"
      if (etc/"wrf-runner/configuration.json").exist?
        rm etc/"wrf-runner/configuration.json"
      end
      if (etc/"wrf-runner/configuration.json.default").exist?
        rm etc/"wrf-runner/configuration.json.default"
      end
    end
    if !(etc/"wrf-runner/configuration.json").exist?
      (etc/"wrf-runner").install "configuration.json"
    end
    #Yeah, I know this seems convoluted, but it's the way to go apparently
    libexec.install "wrf-linker.sh"
    bin.install_symlink libexec/"wrf-linker.sh"
    doc.install Dir["doc/*"]
  end

  def caveats
    <<-EOS.undent
      There are three ways to use this program.
      You can either run it from #{HOMEBREW_PREFIX}/lib/#{@@jar_name},
      run "wrf-linker.sh <directory from which you want to run WRFRunner>", or
      cd into the directory from which you want to run the program and run "wrf-linker.sh"
      I highly recommend the third option.
      If you previously ran wrf-linker.sh, you don't need to re-run it.
      If you wish to use this as a library,
      add #{HOMEBREW_PREFIX}/lib/#{@@jar_name} to your classpath.
      The documentation can be found in:
      #{HOMEBREW_PREFIX}/share/doc/#{name}
      run 'open #{HOMEBREW_PREFIX}/share/doc/#{name}/index.html'
      to view it in your default web browser.

      If you are updating from a version less than 4.0.0 to a version of at least 4.0.0,
      check to ensure that none of the Strings in your configuration file start with an '='
      unless they are formulae.  For more details, see:
      https://github.com/Toberumono/WRF-Runner#upgrading-to-version-4
    EOS
  end
end
