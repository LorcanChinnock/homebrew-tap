cask "shot" do
  version "0.7.0-beta.33"
  sha256 "bdef70ad988afd2e87abf3ba00020e71b54ca848cefc978acc8aba03b0227dd2"

  url "https://github.com/LorcanChinnock/shot/releases/download/v#{version}/Shot-v#{version}.zip"
  name "Shot"
  desc "Screenshots, annotations and screen recordings from the menu bar"
  homepage "https://github.com/LorcanChinnock/shot"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Shot.app"

  zap trash: [
    "~/Library/Caches/dev.lorcan.Shot",
    "~/Library/HTTPStorages/dev.lorcan.Shot",
    "~/Library/Preferences/dev.lorcan.Shot.plist",
  ]
end
