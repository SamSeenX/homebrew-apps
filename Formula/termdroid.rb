class Termdroid < Formula
  desc "Terminal cockpit for Android: mirroring, storage, telemetry, and input bridge"
  homepage "https://github.com/SamSeenX/TermDroid"
  version "0.8.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.8.0/termdroid-v0.8.0-darwin-arm64.tar.gz"
    sha256 "97f4a83f7df923ad696e0d283ace860ec2be4ef716282ce39f2181c034a81746"
  else
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.8.0/termdroid-v0.8.0-darwin-amd64.tar.gz"
    sha256 "9f866a4b5544464a80219ea1aa6c6aab04718890903bd66783246e849db8769d"
  end

  depends_on "android-platform-tools"
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
