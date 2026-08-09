cask "notely" do
  version "0.1.9"
  sha256 "4c918e6d2f255c46df264d2527256469f4e40ba84097888eb9e7740b08dd93d1"

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
