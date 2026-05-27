class Clipslots < Formula
  desc "Clipboard slot manager for macOS with global hotkeys"
  homepage "https://github.com/olafglad/clipSlots"
  url "https://github.com/olafglad/clipSlots/releases/download/v1.14.0/clipslots-1.14.0-universal.tar.gz"
  sha256 "6befbc01af2c70e15228ca31c2903f5ba5ff250e309a87441ac83cad5a4b7610"
  license "MIT"
  version "1.14.0"

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
