class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.8.1/jiro_v0.8.1_darwin_arm64"
      sha256 "e7d2c403ab554d95d966c38959ad7f9ad6ab2f961a6e761d1d29ee893e6b8141"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.8.1/jiro_v0.8.1_darwin_amd64"
      sha256 "816b6d9ab7181df80f3e0b97bb9dfd6673b15a5d3e58b228441d0139bac2cc66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.8.1/jiro_v0.8.1_linux_arm64"
      sha256 "4f210b9d50d9a64de2cc588dcd5f1469bf0e39380226b0c44f3083cc118df7f4"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.8.1/jiro_v0.8.1_linux_amd64"
      sha256 "908fac111e6ad53a0f36b38428dd66ad2b4932e13db87d3b7d3216a4609c57d2"
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
