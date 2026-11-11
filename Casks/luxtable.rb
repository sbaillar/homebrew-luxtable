cask "luxtable" do
  version "0.5.4"
  sha256 "298ef728798086ca58ee9ef22edb528f446d8e3f67bf893575842f364a94ba45"

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
