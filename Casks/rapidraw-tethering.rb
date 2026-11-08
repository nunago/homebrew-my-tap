cask "rapidraw-tethering" do
  arch arm: "macos-15_aarch64", intel: "macos-15-intel_x64"

  version "1.6.9"
  sha256 arm:   "4e1a98a9050b65999c61cb0cdfd2c3921c393e1780aa5ad8b59c03f459fc90ef",
         intel: "c60598794895f75d3bd0dc07a8b5ab97928d924fad17fc65f2f87d9b0edb9fc6"

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
