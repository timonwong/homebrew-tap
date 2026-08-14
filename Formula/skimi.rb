class Skimi < Formula
  desc "Skill manager for AI agents"
  homepage "https://github.com/timonwong/skimi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/skimi/releases/download/v0.3.1/skimi_0.3.1_darwin_arm64.tar.gz"
      sha256 "66e0b992073be8fc5bffe144e2fa3b0bcd5ac98bad727a30f6c51857660c8e87"
    else
      url "https://github.com/timonwong/skimi/releases/download/v0.3.1/skimi_0.3.1_darwin_amd64.tar.gz"
      sha256 "39cd7dfe1a94204b92a9cea4d526ade6b9801d78880a54fdbf172125403df736"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/skimi/releases/download/v0.3.1/skimi_0.3.1_linux_arm64.tar.gz"
      sha256 "ced5eabd88c49706b82421e6a4097dab59715e4d4210ac36a2e423c23073cd69"
    else
      url "https://github.com/timonwong/skimi/releases/download/v0.3.1/skimi_0.3.1_linux_amd64.tar.gz"
      sha256 "ccfebdadfd58001cf14deceb6a70502355cb569364a0682ae1e46edf9919e449"
    end
  end

  def install
    bin.install "skimi"
  end

  test do
    assert_match "skimi manages AI agent skills", shell_output("#{bin}/skimi --help")
  end
end
