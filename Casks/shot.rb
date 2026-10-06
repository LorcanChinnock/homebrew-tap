cask "shot" do
  version "0.7.0-beta.4"
  sha256 "2a08a7ad1b1eb0607139eb7881147749116c6e41d8eb3c565d7f9742e347fd61"

  url "https://github.com/LorcanChinnock/shot/releases/download/v#{version}/Shot-v#{version}.zip"
  name "Shot"
  desc "Screenshots, annotations and screen recordings from the menu bar"
  homepage "https://github.com/LorcanChinnock/shot"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Shot.app"

  zap trash: [
    "~/Library/Caches/dev.lorcan.Shot",
    "~/Library/HTTPStorages/dev.lorcan.Shot",
    "~/Library/Preferences/dev.lorcan.Shot.plist",
  ]
end
