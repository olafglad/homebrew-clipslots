class Clipslots < Formula
  desc "Clipboard slot manager for macOS with global hotkeys"
  homepage "https://github.com/olafglad/clipSlots"
  url "https://github.com/olafglad/clipSlots/releases/download/v1.15.1/clipslots-1.15.1-universal.tar.gz"
  sha256 "a30dd4692499b81fbeb94f101afbe5f6010868ad6d52318fc94d054b1fa7e867"
  license "MIT"
  version "1.15.1"

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
