class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.9.0/jiro_v0.9.0_darwin_arm64"
      sha256 "eb8c20314af4818c9bb0f8cd5d8c9d2ea7e79db36d46af41f0f2ddc72cf3cf53"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.9.0/jiro_v0.9.0_darwin_amd64"
      sha256 "dea0ea7e494f730d5530cc276921ae3d1398a5d23ea52b52e61c4977399d9fb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.9.0/jiro_v0.9.0_linux_arm64"
      sha256 "506b454c562ef1d54dbd79ab6ff31976fafcf2e6912e81223a0cdbc39669abba"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.9.0/jiro_v0.9.0_linux_amd64"
      sha256 "8397902af8abb8b4a3aa1b1c29cb7d83a501f86227d19210f6a4bdb9e5d9ff58"
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
