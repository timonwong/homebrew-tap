class Jiro < Formula
  desc "Jira CLI for humans, scripts, and AI agents"
  homepage "https://github.com/timonwong/jiro"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.13.0/jiro_v0.13.0_darwin_arm64"
      sha256 "4ebd3711053ee33723b7493ec37bee4e1c7a9b3aeecb245a97408959d92eb258"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.13.0/jiro_v0.13.0_darwin_amd64"
      sha256 "e6ec65974d991a196ec1463b4325d2d776ceaf1bb10c208fd7c8dcb02875ecad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/timonwong/jiro/releases/download/v0.13.0/jiro_v0.13.0_linux_arm64"
      sha256 "c044aae8ad9a9fa6bf215dfaea792334741c926da82c290ec1602435c6d49db0"
    else
      url "https://github.com/timonwong/jiro/releases/download/v0.13.0/jiro_v0.13.0_linux_amd64"
      sha256 "53029f499a39699d4fdf93ac7bf5b9ef5ab4262718e54ab8f9133b44e5008738"
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
