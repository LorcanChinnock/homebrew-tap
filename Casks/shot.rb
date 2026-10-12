cask "shot" do
  version "0.7.0-beta.41"
  sha256 "d6f6114c23741e2dc4698c61bd578a7eb42a6f17f3cc02a41a221c91059108f0"

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
  binary "#{appdir}/Shot.app/Contents/MacOS/shot-cli", target: "shot"

  zap trash: [
    "~/Library/Caches/dev.lorcan.Shot",
    "~/Library/HTTPStorages/dev.lorcan.Shot",
    "~/Library/Preferences/dev.lorcan.Shot.plist",
  ]
end
