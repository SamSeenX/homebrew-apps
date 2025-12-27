class Diskman < Formula
  include Language::Python::Virtualenv

  desc "DiskMan V3 - Enhanced Disk Space Analyzer"
  homepage "https://github.com/SamSeenX/DiskMan"
  url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.6.tar.gz"
  sha256 "2669e58c0eb858d0101b425f1118abd333b1fe53975e8f6fa85fe148556e90fc"
  license "MIT"

  depends_on "python@3.11"

  # Dependencies
  resource "colorama" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.6.tar.gz"
    sha256 "2669e58c0eb858d0101b425f1118abd333b1fe53975e8f6fa85fe148556e90fc"
  end

  resource "humanize" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.6.tar.gz"
    sha256 "2669e58c0eb858d0101b425f1118abd333b1fe53975e8f6fa85fe148556e90fc"
  end

  resource "send2trash" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.6.tar.gz"
    sha256 "2669e58c0eb858d0101b425f1118abd333b1fe53975e8f6fa85fe148556e90fc"
  end

  def install
    virtualenv_create(libexec, "python3.11")
    
    resource("colorama").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("humanize").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("send2trash").stage { system libexec/"bin/python", "-m", "pip", "install", "." }

    # Install the main package
    system libexec/"bin/python", "-m", "pip", "install", ".", "--no-deps", "--ignore-installed"

    # Link the script
    bin.install_symlink libexec/"bin/diskman"
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
