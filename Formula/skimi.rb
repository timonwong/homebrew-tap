class Skimi < Formula
  desc "Skill manager for AI agents"
  homepage "https://github.com/timonwong/skimi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/skimi/releases/download/v0.3.0/skimi_0.3.0_darwin_arm64.tar.gz"
      sha256 "65e521a1e7e23c4bec89a864bab30389aa29e2430ce0086277e3d198ffb18727"
    else
      url "https://github.com/timonwong/skimi/releases/download/v0.3.0/skimi_0.3.0_darwin_amd64.tar.gz"
      sha256 "51a05a37f733a99617a598d67b606268626ea48d9cdb20824a12aab8ebd13067"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/skimi/releases/download/v0.3.0/skimi_0.3.0_linux_arm64.tar.gz"
      sha256 "de47e83b266b56c9bffd371f538fd6a70cdd9d0834a804ba52cb23f5b983066d"
    else
      url "https://github.com/timonwong/skimi/releases/download/v0.3.0/skimi_0.3.0_linux_amd64.tar.gz"
      sha256 "eaccce264d6b563e6ad6204cd54d1b0f596a834e35de3dbc47282b00d6c7f4bb"
    end
  end

  def install
    bin.install "skimi"
  end

  test do
    assert_match "skimi manages AI agent skills", shell_output("#{bin}/skimi --help")
  end
end
