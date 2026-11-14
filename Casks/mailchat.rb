cask "mailchat" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "f295b3892c7c715cfee15e3587034777f30e15c90fcced648dce1944aad1e454",
         intel: "78dd776fd5fa8d301258ddb52a19a30ec9c75242834b74471fa4f8138d4da525"

  url "https://github.com/arrake0101/mailchat/releases/download/v#{version}/MailChat_#{version}_#{arch}.dmg"
  name "MailChat"
  desc "IM-style desktop email client with Agent-driven config.toml and secret vault"
  homepage "https://github.com/arrake0101/mailchat"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MailChat.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MailChat.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.mailchat.app",
    "~/Library/Caches/com.mailchat.app",
    "~/Library/Preferences/com.mailchat.app.plist",
    "~/Library/Saved Application State/com.mailchat.app.savedState",
  ]
end
