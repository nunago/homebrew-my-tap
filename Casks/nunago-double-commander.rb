cask "nunago-double-commander" do
  arch arm: "aarch64"

  version "1.2.10"
  sha256 arm: "890bf553059d82150b185c0cb7a71ba0de55350d66a0329d941acafb21452470"

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
