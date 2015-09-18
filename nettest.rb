class Nettest < Formula
  desc "A utility for quickly checking a computer's Internet connection status targeted at lazy people."
  @@project_url="https://github.com/Toberumono/Miscellaneous"
  homepage "#{@@project_url}/tree/master/common"
  revision 1

  url "#{@@project_url}.git", :tag => "1.6.0"

  head "#{@@project_url}.git"

  def install
    bin.install "common/nettest" => "nettest"
  end

  def caveats
    <<-EOS.undent
      See nettest -h for usage information.
    EOS
  end
end
