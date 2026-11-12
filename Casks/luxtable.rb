cask "luxtable" do
  version "0.5.7"
  sha256 "42c33e1dcd6829a7e90642119e562e25805e354ba8a4c977a3b20adc59501896"

  url "https://github.com/sbaillar/luxtable/releases/download/v#{version}/Luxtable-#{version}-macos-arm64.dmg"
  name "Luxtable"
  desc "RAW photo workflow: fast culling, sessions and editing"
  homepage "https://luxtable.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Luxtable.app"

  zap trash: [
    "~/Library/Application Support/Luxtable",
    "~/Library/Caches/app.luxtable.Luxtable",
    "~/Library/Preferences/app.luxtable.Luxtable.plist",
  ]

  caveats <<~EOS
    Luxtable is signed with its own certificate and is not notarized by Apple,
    so macOS blocks the first launch. Open Luxtable once, then choose
    System Settings > Privacy & Security > Open Anyway.
  EOS
end
