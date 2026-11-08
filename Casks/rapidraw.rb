cask "rapidraw" do
  arch arm: "macos-15_aarch64", intel: "macos-15-intel_x64"

  version "1.6.9"
  sha256 arm:   "c0cad5dd47332d0e8a95245cedc29a3410626c2f8a9820865f632c6e28cdb1c0",
         intel: "217055a49ad680ff9b890511406747e0dd9d72181325e1ac4bd6c32fee3e618a"

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
