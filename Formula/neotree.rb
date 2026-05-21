class Neotree < Formula
  desc "Fast, minimal, developer-focused directory tree CLI — written in C"
  homepage "https://github.com/bharadwajsanket/neotree"
  version "0.3.1"
  license "MIT"

  on_macos do
    url "https://github.com/bharadwajsanket/neotree/releases/download/v#{version}/neotree-macos"
    sha256 "2d1ff834db3426d33d0dff46abbae47499ec4043e892b31ff0902b2bc77877af"
  end

  on_linux do
    url "https://github.com/bharadwajsanket/neotree/releases/download/v#{version}/neotree-linux"
    sha256 "b77f6c435d0981d034d0c6eca5ab4a97097dffd7efda3e4ee4160ab43ff3c8be"
  end

  def install
    binary = OS.mac? ? "neotree-macos" : "neotree-linux"
    bin.install binary => "neotree"
  end

  test do
    assert_match "neotree #{version}", shell_output("#{bin}/neotree --version")
  end
end
