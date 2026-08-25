class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.12.0/jiro_v0.12.0_darwin_arm64"
      sha256 "04125bab9f063c698696f1e16b5337a7aebaa6106b6037e8587f27597635969a"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.12.0/jiro_v0.12.0_darwin_amd64"
      sha256 "5ed095fd19ec7e5eacefa0f910765667f307b16d0f8592a21dc5ae6c3b7ed761"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.12.0/jiro_v0.12.0_linux_arm64"
      sha256 "2fb87a3aaeff9c29d5d997ecbdd15ff9dd134ed90f5e4d3c722010232558f13f"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.12.0/jiro_v0.12.0_linux_amd64"
      sha256 "3c370b39275fda72170aad14e252339615c0c541bb907cc5f69692676f49e954"
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
