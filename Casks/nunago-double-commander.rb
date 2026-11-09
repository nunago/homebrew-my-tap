cask "nunago-double-commander" do
  arch arm: "aarch64"

  version "1.2.11"
  sha256 arm: "5fd85c49a968c2fa23bf77561035aaed87924a569cad290dbb278fe483392c3f"

  url "https://github.com/doublecmd/doublecmd/releases/download/v#{version}/doublecmd-#{version}.cocoa.#{arch}.dmg"
  name "Double Commander"
  desc "File manager with two panels"
  homepage "https://doublecmd.sourceforge.io/"

  # The macOS build can lag behind other platforms, so follow the official
  # download page's macOS link rather than the latest release.
  livecheck do
    url "https://sourceforge.net/p/doublecmd/wiki/Download/"
    strategy :page_match
    regex(%r{/v?(\d+(?:\.\d+)+)/doublecmd[._-]v?\d+(?:\.\d+)+\.cocoa\.#{arch}\.dmg}i)
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Double Commander.app"

  zap trash: "~/Library/Caches/doublecmd"
end
