class Neotree < Formula
  desc "Fast directory tree CLI with glob filtering, sorting, and export"
  homepage "https://github.com/bharadwajsanket/neotree"
  url "https://github.com/bharadwajsanket/neotree/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "29a3eda680c36c44c6fc236e37f09f5d27b34a2aec488e69e9aa4f8d324f7c0c"
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
