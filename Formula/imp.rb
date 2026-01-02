class Imp < Formula
  include Language::Python::Virtualenv

  desc "IMP - Image Optimizer CLI Tool"
  homepage "https://github.com/SamSeenX/imp-cli"
  url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "71cc9a772a48d86db8a768f9351f9e23b88b0966be89f648f490410501ba55d3"
  license "MIT"

  depends_on "python@3.11"
  depends_on "jpeg"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "webp"
  depends_on "zlib"

  resource "pillow" do
    url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "71cc9a772a48d86db8a768f9351f9e23b88b0966be89f648f490410501ba55d3"
  end

  resource "rich" do
    url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "71cc9a772a48d86db8a768f9351f9e23b88b0966be89f648f490410501ba55d3"
  end

  resource "markdown-it-py" do
    url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "71cc9a772a48d86db8a768f9351f9e23b88b0966be89f648f490410501ba55d3"
  end

  resource "mdurl" do
    url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "71cc9a772a48d86db8a768f9351f9e23b88b0966be89f648f490410501ba55d3"
  end

  resource "pygments" do
    url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "71cc9a772a48d86db8a768f9351f9e23b88b0966be89f648f490410501ba55d3"
  end

  def install
    virtualenv_install_with_resources
    
    # Link the script
    bin.install_symlink libexec/"bin/imp"
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
