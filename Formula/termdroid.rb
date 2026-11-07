class Termdroid < Formula
  desc "Terminal cockpit for Android: mirroring, storage, telemetry, and input bridge"
  homepage "https://github.com/SamSeenX/TermDroid"
  version "0.8.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.8.2/termdroid-v0.8.2-darwin-arm64.tar.gz"
    sha256 "758ab1115c3ba59a8d3121ac6a1a8c9b319e7a83d376ca7eb04085e330ad3ca1"
  else
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.8.2/termdroid-v0.8.2-darwin-amd64.tar.gz"
    sha256 "45c6b7531183a8e835af051950d99216cf4c43141f92e4a6405ce781b0ff4ea1"
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
