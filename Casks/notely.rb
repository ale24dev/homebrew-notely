cask "notely" do
  version "0.1.8"
  sha256 "d6e8aeadfb9c15980d8f2a9fcb2375ff2f5c1780cc4817ef0572c8a3e5853a73"

  url "https://github.com/ale24dev/notely/releases/download/v#{version}/Notely_#{version}_universal.dmg"
  name "Notely"
  desc "Gestor de notas en Markdown para el menu bar de macOS"
  homepage "https://github.com/ale24dev/notely"

  # Coincide con minimumSystemVersion de src-tauri/tauri.conf.json.
  depends_on macos: ">= :catalina"

  app "Notely.app"

  # Deja que `brew livecheck` detecte versiones nuevas por los tags de
  # GitHub Releases, para poder automatizar el bump del Cask más adelante.
  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/com.24notely.app",
    "~/Library/Preferences/com.24notely.app.plist",
    "~/Library/Saved Application State/com.24notely.app.savedState",
  ]
end
