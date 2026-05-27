class Neotree < Formula
  desc "Fast directory tree CLI with glob filtering, sorting, and export"
  homepage "https://github.com/bharadwajsanket/neotree"
  url "https://github.com/bharadwajsanket/neotree/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ebb961b2a0378b75279596b51a9d1f42a0b11aaf99bc2f2435f25c902bebc128"
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
