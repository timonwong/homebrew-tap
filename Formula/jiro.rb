class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.8.0/jiro_v0.8.0_darwin_arm64"
      sha256 "2a4289a1db48572f6eb46c35c442378c65281f02f57d81d76b767b149fa27b5e"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.8.0/jiro_v0.8.0_darwin_amd64"
      sha256 "28affab3506c48743b3f71a5eea1848072cda8ef2b7986f52ab752fd7318609e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.8.0/jiro_v0.8.0_linux_arm64"
      sha256 "616893a9fd108f91aa3cd5dc9736dae81bf1515a8f2ccbd77601c210995fdff1"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.8.0/jiro_v0.8.0_linux_amd64"
      sha256 "287b6300e7b8acdf3db3b96fa8646381da3d4f767f30150a68eb7c69a648d753"
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
