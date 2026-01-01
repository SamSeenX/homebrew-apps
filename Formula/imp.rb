class Imp < Formula
  include Language::Python::Virtualenv

  desc "IMP - Image Optimizer CLI Tool"
  homepage "https://github.com/SamSeenX/imp-cli"
  url "https://github.com/SamSeenX/imp-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e106c9420489f4174b0480537e73690c24c024a305adad3f704f0d37a9341c3c"
  license "MIT"

  depends_on "python@3.11"

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/f8/3e/32cbd0129a28686621434cbf17bb64bf1458bfb838f1f668262f120d3a3f/pillow-11.1.0.tar.gz"
    sha256 "fd0e967d74a362f8f94fd1435aa698bc7f24cdd248a02fbc33d9e856c5c73a37"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eeaab2c2bc/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3ead5f90e64e89dab15ae08aac77f6c4f18/mdurl-0.1.2.tar.gz"
    sha256 "e0173d29bcc19f0fcd3e74b44d550ca9a59126d456c5952b19794596667ad6e9"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982c7b0ec9c9401/pygments-2.19.1.tar.gz"
    sha256 "47aac1a2c2fb601510dd0e559f64f7a75e25f6ceca51ae60edef13df89a27395"
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
