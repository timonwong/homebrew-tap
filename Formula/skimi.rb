class Skimi < Formula
  desc "Skill manager for AI agents"
  homepage "https://github.com/timonwong/skimi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/skimi/releases/download/v0.2.0/skimi_0.2.0_darwin_arm64.tar.gz"
      sha256 "3f5e2de8270c55b2b6e591f3f9a7892f69a7b53327bee6890976ec0e1ab34396"
    else
      url "https://github.com/timonwong/skimi/releases/download/v0.2.0/skimi_0.2.0_darwin_amd64.tar.gz"
      sha256 "e62ec8cc21842e18b2b67dd9864f306c2dfd28f122adeca0ae1aa7540c5c62c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/skimi/releases/download/v0.2.0/skimi_0.2.0_linux_arm64.tar.gz"
      sha256 "a0255bca03fdcdb8c08ad528fbe02b6d3e01deb8bd0fc5ca31902d44c2a69c67"
    else
      url "https://github.com/timonwong/skimi/releases/download/v0.2.0/skimi_0.2.0_linux_amd64.tar.gz"
      sha256 "1af941970c7fb68b9964896de3aece370271d066df51b1210651529049fde41b"
    end
  end

  def install
    bin.install "skimi"
  end

  test do
    assert_match "A skill manager for AI agents", shell_output("#{bin}/skimi --help")
  end
end
