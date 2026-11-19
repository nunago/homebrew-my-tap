cask "rapidraw" do
  arch arm: "macos-15_aarch64", intel: "macos-15-intel_x64"

  version "1.7.0"
  sha256 arm:   "19c0bb3d405b4c047e338884df5034be9f0a3f44669344f86254f9972d70dd06",
         intel: "d0561f9078fb7f348e46789f47eafe1b115ce5826926371cdc3d25203edd63db"

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
