cask "nunago-double-commander" do
  arch arm: "aarch64"

  version "1.2.8"
  sha256 arm: "7432cf00b9d111730b26ca69d546d40408ca1b8e7ac31253fbc68780799120f0"

  url "https://downloads.sourceforge.net/doublecmd/Double%20Commander/v#{version}/doublecmd-#{version}.cocoa.#{arch}.dmg"
  name "Double Commander"
  desc "File manager with two panels"
  homepage "https://doublecmd.sourceforge.io/"

  livecheck do
    url :url
    regex(%r{/v?(\d+(?:\.\d+)+)/doublecmd[._-]v?\d+(?:\.\d+)+\.cocoa\.#{arch}\.dmg}i)
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Double Commander.app"

  zap trash: "~/Library/Caches/doublecmd"
end
