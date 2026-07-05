class Neotree < Formula
  desc "Traversal by Instinct - fast directory tree CLI"
  homepage "https://github.com/bharadwajsanket/neotree"
  url "https://github.com/bharadwajsanket/neotree/archive/refs/tags/v2.5.4.tar.gz"
  sha256 "2a11feeabf81a46e7a91cb84513e7c25c58eff03d0b25449acebf0e9f84e8051"
  license "GPL-3.0-only"
  head "https://github.com/bharadwajsanket/neotree.git", branch: "main"

  def install
    system "make"
    bin.install "neotree"
    bin.install_symlink "neotree" => "ntree"
    man1.install "man/neotree.1"
    man1.install_symlink "neotree.1" => "ntree.1"
  end

  test do
    assert_match "neotree #{version}", shell_output("#{bin}/neotree --version")
    (testpath/"src").mkpath
    (testpath/"src/main.c").write("// hello")
    assert_match "main.c", shell_output("#{bin}/neotree #{testpath}")
  end
end
