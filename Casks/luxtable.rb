cask "luxtable" do
  version "0.5.8"
  sha256 "4e17e975b5f7f1ff84541d6426000a926217d20675c9f6a0fe2543da90adfa59"

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
