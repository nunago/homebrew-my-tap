cask "nunago-double-commander" do
  arch arm: "aarch64"

  version "1.2.8"
  sha256 arm: "7432cf00b9d111730b26ca69d546d40408ca1b8e7ac31253fbc68780799120f0"

  url "https://github.com/doublecmd/doublecmd/releases/download/v#{version}/doublecmd-#{version}.cocoa.#{arch}.dmg"
  name "Double Commander"
  desc "File manager with two panels"
  homepage "https://doublecmd.sourceforge.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Double Commander.app"

  zap trash: "~/Library/Caches/doublecmd"
end
