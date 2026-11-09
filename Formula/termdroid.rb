class Termdroid < Formula
  desc "Terminal cockpit for Android: mirroring, storage, telemetry, and input bridge"
  homepage "https://github.com/SamSeenX/TermDroid"
  version "0.8.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.8.2/termdroid-v0.8.2-darwin-arm64.tar.gz"
    sha256 "758ab1115c3ba59a8d3121acf1d23e23ee68ef3868844f094b1880f9d4e480e6"
  else
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.8.2/termdroid-v0.8.2-darwin-amd64.tar.gz"
    sha256 "45c6b7531183a8e835af05190b2c92ba007c5faa27223a66f5f5100156dba5d2"
  end

  depends_on "scrcpy"

  def install
    if Hardware::CPU.arm?
      bin.install "termdroid-darwin-arm64" => "termdroid"
    else
      bin.install "termdroid-darwin-amd64" => "termdroid"
    end
  end

  def caveats
    <<~EOS
      ----------------------------------------------------------------------
      Android Control Cockpit Installed Successfully!
      ----------------------------------------------------------------------

      At runtime, adb must be accessible from your PATH.
      If adb is not installed, you can install it via Homebrew Cask:

        brew install --cask android-platform-tools

      To run TermDroid, connect your Android device and run:

        termdroid

      For CLI shortcuts:

        termdroid mirror
        termdroid scan
        termdroid wifi

      ----------------------------------------------------------------------
    EOS
  end

  test do
    system "#{bin}/termdroid", "--help"
  end
end
