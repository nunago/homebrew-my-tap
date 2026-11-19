cask "rapidraw-tethering" do
  arch arm: "macos-15_aarch64", intel: "macos-15-intel_x64"

  version "1.7.0"
  sha256 arm:   "c97dc584142667b9141a676967a8a1c9b02ba486f42c1324912552e0c3b112ba",
         intel: "de92d4ed41d46cd7d3f5cf7452f03fb5961c35d9d0b0a88b9e6903b9992fb581"

  url "https://github.com/CyberTimon/RapidRAW/releases/download/v#{version}/02_tethering_RapidRAW_v#{version}_#{arch}.dmg"
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
