class Imp < Formula
  include Language::Python::Virtualenv

  desc "IMP - Image Optimizer CLI Tool"
  homepage "https://github.com/SamSeenX/imp-cli"
  url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e106c9420489f4174b0480537e73690c24c024a305adad3f704f0d37a9341c3c"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create virtualenv and install dependencies via pip
    venv = virtualenv_create(libexec, "python3.11")
    
    # Install Python dependencies
    system libexec/"bin/pip", "install", "Pillow", "rich"

    # Install the main package
    system libexec/"bin/pip", "install", ".", "--no-deps"

    # Create wrapper script
    (bin/"imp").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python" "#{libexec}/bin/imp" "$@"
    EOS
  end

  def caveats
    <<~EOS
      ----------------------------------------------------------------------
      🎉 IMP - Image Optimizer Installed Successfully! 🎉
      ----------------------------------------------------------------------
      
      🚀 To run IMP, just type:
      
        imp <image_or_folder>

      📖 For help:
      
        imp --help

      🔗 Website: https://imp-cli.samseen.dev
      ----------------------------------------------------------------------
    EOS
  end

  test do
    system "#{bin}/imp", "--help"
  end
end
