class Diskman < Formula
  include Language::Python::Virtualenv

  desc "DiskMan V3 - Enhanced Disk Space Analyzer"
  homepage "https://github.com/SamSeenX/DiskMan"
  url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.10.tar.gz"
  sha256 "ecaa6166d5047b4f55b9a12f7d37ecdb93667bef7778386dd3c3a5e60d8c62d7"
  license "MIT"

  depends_on "python@3.11"

  # Dependencies
  resource "colorama" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.10.tar.gz"
    sha256 "ecaa6166d5047b4f55b9a12f7d37ecdb93667bef7778386dd3c3a5e60d8c62d7"
  end

  resource "humanize" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.10.tar.gz"
    sha256 "ecaa6166d5047b4f55b9a12f7d37ecdb93667bef7778386dd3c3a5e60d8c62d7"
  end

  resource "send2trash" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.10.tar.gz"
    sha256 "ecaa6166d5047b4f55b9a12f7d37ecdb93667bef7778386dd3c3a5e60d8c62d7"
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
