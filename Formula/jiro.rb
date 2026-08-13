class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.7.0/jiro_v0.7.0_darwin_arm64"
      sha256 "b332d75199d74a76047e5c94be246f9a67262155c3623ba8e2f846ab8b510b45"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.7.0/jiro_v0.7.0_darwin_amd64"
      sha256 "5e3f55d34d2804a34c3f5a0f6149a106cec6e5bdba0231d982999fa34ea8a56e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.7.0/jiro_v0.7.0_linux_arm64"
      sha256 "3311a68af22e99a32300ce51994d19db0571921c57d2c914c26cf6ebbce28ea1"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.7.0/jiro_v0.7.0_linux_amd64"
      sha256 "65a1a03539f68801a1d7329392aaf1db5d13c871be8ebb9d207edcbc70e573c3"
    end
  end

  def install
    binary = Dir["jiro_*"].first
    chmod 0755, binary
    bin.install binary => "jiro"
  end

  test do
    assert_equal "jiro version #{version}", shell_output("#{bin}/jiro --version").strip
    assert_equal "h1. Hello", pipe_output("#{bin}/jiro jfm to-jira", "# Hello\n").strip
  end
end
