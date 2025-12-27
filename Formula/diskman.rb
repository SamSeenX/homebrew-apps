class Diskman < Formula
  include Language::Python::Virtualenv

  desc "DiskMan V3 - Enhanced Disk Space Analyzer"
  homepage "https://github.com/SamSeenX/DiskMan"
  url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.7.tar.gz"
  sha256 "c1dc24122f5b9aafbcc0c41c3b8926763ea1aeff0a7d079e20a07411a48e05cc"
  license "MIT"

  depends_on "python@3.11"

  # Dependencies
  resource "colorama" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.7.tar.gz"
    sha256 "c1dc24122f5b9aafbcc0c41c3b8926763ea1aeff0a7d079e20a07411a48e05cc"
  end

  resource "humanize" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.7.tar.gz"
    sha256 "c1dc24122f5b9aafbcc0c41c3b8926763ea1aeff0a7d079e20a07411a48e05cc"
  end

  resource "send2trash" do
    url "https://github.com/SamSeenX/DiskMan/archive/refs/tags/v3.0.7.tar.gz"
    sha256 "c1dc24122f5b9aafbcc0c41c3b8926763ea1aeff0a7d079e20a07411a48e05cc"
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
