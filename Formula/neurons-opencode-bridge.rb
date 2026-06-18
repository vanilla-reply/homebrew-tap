class NeuronsOpencodeBridge < Formula
  desc "Local OpenCode provider bridge for Reply Neurons"
  homepage "https://github.com/vanilla-reply/neurons-opencode-bridge"
  url "https://github.com/vanilla-reply/neurons-opencode-bridge/releases/download/v0.1.1/neurons"
  sha256 "3d0512a5899a887bb8e187c8661c0b71aa619bdfb902d636c9ea87883ed7b530"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "neurons"
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
