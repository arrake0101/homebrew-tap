cask "mailchat" do
  version "0.3.0"

  on_arm do
    sha256 "4218eaf72383999701220fcb084ff86190ce8edba3318dda912ba260a4896225"
    url "https://github.com/arrake0101/mailchat/releases/download/v#{version}/MailChat_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "41979d181937f29c7b716f82e6559612181a102f3a9637b666dec4b66942d110"
    url "https://github.com/arrake0101/mailchat/releases/download/v#{version}/MailChat_#{version}_x64.dmg"
  end

  name "MailChat"
  desc "Instant-messaging style desktop email client with declarative config.toml"
  homepage "https://github.com/arrake0101/mailchat"

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
  ]
end