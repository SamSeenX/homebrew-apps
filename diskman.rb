class Diskman < Formula
  include Language::Python::Virtualenv

  desc "DiskMan V3 - Enhanced Disk Space Analyzer"
  homepage "https://github.com/MrSamSeen/DiskMan"
  url "https://github.com/MrSamSeen/DiskMan/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "470a558e8937a12f2784a98ef460d1d16d3331bb0904063a5039c5c64ae1f4b9"
  license "MIT"

  depends_on "python@3.11"

  # Dependencies
  resource "colorama" do
    url "https://github.com/MrSamSeen/DiskMan/archive/refs/tags/v3.0.3.tar.gz"
    sha256 "470a558e8937a12f2784a98ef460d1d16d3331bb0904063a5039c5c64ae1f4b9"
  end

  resource "humanize" do
    url "https://github.com/MrSamSeen/DiskMan/archive/refs/tags/v3.0.3.tar.gz"
    sha256 "470a558e8937a12f2784a98ef460d1d16d3331bb0904063a5039c5c64ae1f4b9"
  end

  resource "send2trash" do
    url "https://github.com/MrSamSeen/DiskMan/archive/refs/tags/v3.0.3.tar.gz"
    sha256 "470a558e8937a12f2784a98ef460d1d16d3331bb0904063a5039c5c64ae1f4b9"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      ----------------------------------------------------------------------
      🎉 DiskMan V3 Installed Successfully! 🎉
      ----------------------------------------------------------------------
      
      🚀 To run DiskMan, just type:
      
        diskman

      ----------------------------------------------------------------------
    EOS
  end

  test do
    system "#{bin}/diskman", "--help"
  end
end
