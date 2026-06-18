class NeuronsOpencodeBridge < Formula
  desc "Local OpenCode provider bridge for Reply Neurons"
  homepage "https://github.com/vanilla-reply/neurons-opencode-bridge"
  url "ssh://git@github.com/vanilla-reply/neurons-opencode-bridge.git",
      using: GitDownloadStrategy,
      tag: "v0.1.1",
      revision: "004b1f56e33acf306cbea6b39131b2a4ccd87007"
  license "MIT"

  depends_on "python@3.11"

  def install
    libexec.install "neurons", "neurons_bridge"
    bin.write_exec_script libexec/"neurons"
  end

  test do
    assert_match "CLI bridge for Neurons", shell_output("#{bin}/neurons --help")
  end

  def caveats
    <<~EOS
      Neurons OpenCode Bridge requires:
        - Google Chrome or Microsoft Edge
        - opencode on PATH
        - an authenticated Reply Neurons account

      Start it in an OpenCode project with:
        neurons
    EOS
  end
end
