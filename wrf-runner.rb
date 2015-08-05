class WrfRunner < Formula
  desc "A script for automatically running WRF and WPS models."
  @@jar_name="WRFRunner.jar"
  @@project_url="https://github.com/Toberumono/WRF-Runner"
  homepage "#{@@project_url}"

  url "#{@@project_url}.git", :tag => "1.5.6"

  head "#{@@project_url}.git"

  option "with-fresh-configuration", "Use this to wipe your existing configuration"
  option "with-fine-logging", "Use this to set the logging level to fine"

  depends_on :java => "1.8+"
  depends_on "ant" => :build
  depends_on "wget"
  depends_on "toberumono/tap/namelist-parser"
  depends_on "toberumono/tap/json-library"
  depends_on "toberumono/tap/structures"
  depends_on "toberumono/tap/utils"

  def install
    if build.with? "fine-logging"
      inreplace "src/toberumono/wrf/WRFRunner.java" "log.setLevel(Level.INFO);" "log.setLevel(Level.FINE);"
    end
    system "ant", "-Dprefix=./", "-Duse.homebrew=true", "-Dbrew.path=#{HOMEBREW_PREFIX}/bin/brew"
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
    #Yeah, this is messy, but Homebrew likes to make things execute only.
    cp "wrf-linker.sh", "#{HOMEBREW_PREFIX}/bin/wrf-linker.sh"
  end

  def caveats
    <<-EOS.undent
      There are three ways to use this program.
      You can either run it from #{HOMEBREW_PREFIX}/lib/#{@@jar_name},
      you can run "wrf-linker.sh <directory from which you want to run WRFRunner>", or
      cd into the directory from which you want to run the program and run "wrf-linker.sh"
      I highly recommend the third option.
      If you previously ran wrf-linker.sh, you don't need to re-run it.
      If you wish to use this as a library,
      add #{HOMEBREW_PREFIX}/lib/#{@@jar_name} to your classpath.
    EOS
  end
end
