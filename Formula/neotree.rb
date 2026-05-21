class Neotree < Formula
  desc "Fast directory tree CLI with glob filtering, sorting, and export"
  homepage "https://github.com/bharadwajsanket/neotree"
  url "https://github.com/bharadwajsanket/neotree/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "dc073bd755cf1b5d2734e89312a585de88e6ba4cb084fd2f18ce0ff52d6aa7db"
  license "MIT"
  head "https://github.com/bharadwajsanket/neotree.git", branch: "main"

  def install
    system "make"
    bin.install "neotree"
  end

  test do
    assert_match "neotree #{version}", shell_output("#{bin}/neotree --version")
    (testpath/"src").mkpath
    (testpath/"src/main.c").write("// hello")
    assert_match "main.c", shell_output("#{bin}/neotree #{testpath}")
  end
end
