class Termdroid < Formula
  desc "Terminal cockpit for Android: mirroring, storage, telemetry, and input bridge"
  homepage "https://github.com/SamSeenX/TermDroid"
  version "0.7.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.7.2/termdroid-v0.7.2-darwin-arm64.tar.gz"
    sha256 "c6c54e0b8a5c479024811bbd134a3f8d3ab3a3cbdf08171d060b4f5a55d80df3"
  else
    url "https://github.com/SamSeenX/TermDroid/releases/download/v0.7.2/termdroid-v0.7.2-darwin-amd64.tar.gz"
    sha256 "688a59fcdfb7806422462bd48cbf3cad998acf86d729ccb4f6ae5ee7456c34c4"
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
