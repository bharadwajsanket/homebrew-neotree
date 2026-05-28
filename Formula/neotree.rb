class Neotree < Formula
  desc "Fast directory tree CLI with glob filtering, sorting, and export"
  homepage "https://github.com/bharadwajsanket/neotree"
  url "https://github.com/bharadwajsanket/neotree/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "4696bcf515dda5155e60476675350a801c31834e328d6c35b71cf9d5756b0fde"
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
