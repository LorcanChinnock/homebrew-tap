cask "shot" do
  version "0.7.0-beta.42"
  sha256 "3179507678c3ad638252edea80a176e33029aac1371c91b4474cdf8352fe7fe1"

  url "https://github.com/LorcanChinnock/shot/releases/download/v#{version}/Shot-v#{version}.zip"
  name "Shot"
  desc "Screenshots, annotations and screen recordings from the menu bar"
  homepage "https://shot.lorcanchinnock.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Shot.app"
  binary "#{appdir}/Shot.app/Contents/MacOS/shot-cli", target: "shot"

  uninstall quit: "dev.lorcan.Shot"

  zap trash: [
    "~/Library/Application Support/dev.lorcan.Shot",
    "~/Library/Caches/dev.lorcan.Shot",
    "~/Library/HTTPStorages/dev.lorcan.Shot",
    "~/Library/HTTPStorages/dev.lorcan.Shot.binarycookies",
    "~/Library/Preferences/dev.lorcan.Shot.plist",
  ]

  caveats <<~EOS
    Shot isn't notarized by Apple yet, so macOS blocks it the first time you open it.
    Open Shot and click Done, then click Open Anyway in
    System Settings > Privacy & Security and confirm. You only do this once.
    Steps with pictures: https://shot.lorcanchinnock.com/#install
  EOS
end
