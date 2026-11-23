cask "rapidraw-tethering" do
  arch arm: "macos-15_aarch64", intel: "macos-15-intel_x64"

  version "1.7.1"
  sha256 arm:   "7895471c56a9d5073d6adfd67277439b5af59d14af025914f181f6d227c8fd51",
         intel: "3090e5d0088f24c1925b5e7fe319eb5e3dcace21bc416ed2ceb016cfe3c3b9d7"

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
