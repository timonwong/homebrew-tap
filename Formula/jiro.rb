class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.10.0/jiro_v0.10.0_darwin_arm64"
      sha256 "6de2e0c439780d50ab05f1150fc0724393631d58c6efff3001332b2dbed63c0c"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.10.0/jiro_v0.10.0_darwin_amd64"
      sha256 "9c7df4bb2072e9c4ce475efae445c6e517b94022e4aa89d550bf4a4bcc082c7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.10.0/jiro_v0.10.0_linux_arm64"
      sha256 "75b8728205acf09ef538f2ec849995854b3ade47b9120474bb09bf5b322a1d49"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.10.0/jiro_v0.10.0_linux_amd64"
      sha256 "1255590f1b10d24f51cb5af88bd41c6f24735bf7bbbeea961cebe248e1aca4aa"
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
