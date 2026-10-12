class Clipslots < Formula
  desc "Clipboard slot manager for macOS with global hotkeys"
  homepage "https://github.com/olafglad/clipSlots"
  url "https://github.com/olafglad/clipSlots/releases/download/v1.15.0/clipslots-1.15.0-universal.tar.gz"
  sha256 "16a270523117d9b49761c634f726c9181e749a4eb684b8e5ab09592064e3a83b"
  license "MIT"
  version "1.15.0"

  depends_on :macos => :ventura

  def install
    bin.install "clipslots"
  end

  def caveats
    <<~EOS
      Grant Accessibility permission so global hotkeys work:
        clipslots permissions

      Then start the background daemon:
        clipslots start

      Check status any time with:
        clipslots status
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clipslots --version")
  end
end
