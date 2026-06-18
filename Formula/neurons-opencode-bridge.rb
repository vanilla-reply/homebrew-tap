class NeuronsOpencodeBridge < Formula
  desc "Local OpenCode provider bridge for Reply Neurons"
  homepage "https://github.com/vanilla-reply/neurons-opencode-bridge"
  url "ssh://git@github.com/vanilla-reply/neurons-opencode-bridge.git",
      using: GitDownloadStrategy,
      tag: "v1.2.1",
      revision: "f0f986ec2bb08ff376a721daf857ab4872c53243"
  license "MIT"

  depends_on "python@3.11"
  depends_on "opencode"

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
        - an authenticated Reply Neurons account

      Start it in an OpenCode project with:
        neurons
    EOS
  end
end
