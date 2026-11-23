cask "rapidraw" do
  arch arm: "macos-15_aarch64", intel: "macos-15-intel_x64"

  version "1.7.1"
  sha256 arm:   "14f06525f3455518a09788271b000bc7abb4a90277c93726b11470ae77848c3f",
         intel: "5151dbc39133ba8efb254471f1479b1a2250ba276a412a512bfc042e0e96a5de"

  url "https://github.com/CyberTimon/RapidRAW/releases/download/v#{version}/02_RapidRAW_v#{version}_#{arch}.dmg"
  name "RapidRAW"
  desc "RAW image editor"
  homepage "https://www.getrapidraw.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "rapidraw-tethering"
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
