cask "warble" do
  version "0.1.0-beta.11"
  sha256 "9a6a5475b84410beeb52d79425f40c374d2093d660aa3a15253c5e5bca20f237"

  url "https://github.com/LorcanChinnock/warble/releases/download/v#{version}/Warble-v#{version}.zip"
  name "Warble"
  desc "Music and media controls in the notch"
  homepage "https://warble.lorcanchinnock.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Warble.app"

  uninstall quit: "dev.lorcan.Warble"

  zap trash: [
    "~/Library/Application Support/dev.lorcan.Warble",
    "~/Library/Caches/dev.lorcan.Warble",
    "~/Library/HTTPStorages/dev.lorcan.Warble",
    "~/Library/HTTPStorages/dev.lorcan.Warble.binarycookies",
    "~/Library/Preferences/dev.lorcan.Warble.plist",
  ]

  caveats <<~EOS
    Warble isn't notarized by Apple yet, so macOS blocks it the first time you open it.
    Open Warble and click Done, then click Open Anyway in
    System Settings > Privacy & Security and confirm. You only do this once.
    Steps: https://warble.lorcanchinnock.com/#install
  EOS
end
