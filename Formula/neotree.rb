class Neotree < Formula
  desc "Traversal by Instinct - fast directory tree CLI"
  homepage "https://github.com/bharadwajsanket/neotree"
  url "https://github.com/bharadwajsanket/neotree/archive/refs/tags/v2.5.4.tar.gz"
  sha256 "f9a6d90984bd9705b1df42e77c321c8ef026e70ac498d9dc486c53e0bf7f492b"
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
