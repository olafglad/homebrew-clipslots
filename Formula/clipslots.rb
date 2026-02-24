class Clipslots < Formula
  desc "Clipboard slot manager for macOS with global hotkeys"
  homepage "https://github.com/olafglad/clipSlots"
  url "https://github.com/olafglad/clipSlots/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "47068e4b014af5f14c5d29c8c369c5215e706ed274d0a97cefb094e6656fb702"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos => :ventura

  def install
    system "swift", "build",
           "-c", "release",
           "--arch", "arm64", "--arch", "x86_64",
           "--disable-sandbox"
    bin.install ".build/apple/Products/Release/clipslots"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clipslots --help", 0)
  end
end
