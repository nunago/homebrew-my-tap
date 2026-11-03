cask "rapidraw-tethering" do
  arch arm: "macos-14_aarch64", intel: "macos-15-intel_x64"

  version "1.6.7"
  sha256 arm:   "71f396a1b085f30ac1ab66d52f08af665f8bba5ba9a8a8aa5cd703afa84e8532",
         intel: "26ceb09e2aedef4cdb1b733798355d3cae1de1ffffc06577b52d2ad9d8f2554e"

  url "https://github.com/CyberTimon/RapidRAW/releases/download/v#{version}/02_tethering_RapidRAW_v#{version}_#{arch}.dmg",
      verified: "github.com/CyberTimon/RapidRAW/"
  name "RapidRAW"
  desc "RAW image editor with USB camera tethering"
  homepage "https://www.getrapidraw.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "rapidraw"
  depends_on formula: "libgphoto2"
  depends_on macos: :ventura

  app "RapidRAW.app"

  # The app is only ad-hoc signed, so Gatekeeper would otherwise report it as damaged
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RapidRAW.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.CyberTimon.RapidRAW",
    "~/Library/Caches/io.github.CyberTimon.RapidRAW",
    "~/Library/Logs/io.github.CyberTimon.RapidRAW",
    "~/Library/Preferences/io.github.CyberTimon.RapidRAW.plist",
    "~/Library/WebKit/io.github.CyberTimon.RapidRAW",
  ]
end
