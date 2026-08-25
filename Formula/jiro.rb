class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.11.0/jiro_v0.11.0_darwin_arm64"
      sha256 "69b464e312bc5a069585a402e497a788be1cb04aeeb44823400a4f89610f5e76"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.11.0/jiro_v0.11.0_darwin_amd64"
      sha256 "098086e69a41cdb8a6220ae20d2d0ea01bdfc0720095db67d0a93dfcd7db9b9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.11.0/jiro_v0.11.0_linux_arm64"
      sha256 "e53f161bcd93162bbf1f2103705fa325b0d95389258e7ff08fe9b16433514f7f"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.11.0/jiro_v0.11.0_linux_amd64"
      sha256 "fd9d80f1731d7767250e4a3d63f4d3c07bc46574742a6c0c4f6250267e2648c4"
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
