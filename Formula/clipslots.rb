class Clipslots < Formula
  desc "Clipboard slot manager for macOS with global hotkeys"
  homepage "https://github.com/olafglad/clipSlots"
  url "https://github.com/olafglad/clipSlots/releases/download/v1.13.1/clipslots-1.13.1-universal.tar.gz"
  sha256 "6287c0ba2166f58552682fbe627ad8dedf73d1c13f9c717e3e39cdb61ea8a350"
  license "MIT"
  version "1.13.1"

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
