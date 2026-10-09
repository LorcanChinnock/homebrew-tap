cask "shot" do
  version "0.7.0-beta.35"
  sha256 "4beaa5dee99a74e532297407d1f8479811dc1b2ffa6718dea0443d777dc9f3cf"

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
