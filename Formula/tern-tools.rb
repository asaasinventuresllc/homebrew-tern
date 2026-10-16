class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.5/tern-tools-0.0.5-darwin-universal.tar.gz"
      sha256 "c786390ca98ab686061af39d5620ed14fff24989b756702b039ab8b47a2d27a4"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.5/tern-tools-0.0.5-darwin-universal.tar.gz"
      sha256 "c786390ca98ab686061af39d5620ed14fff24989b756702b039ab8b47a2d27a4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.5/tern-tools-0.0.5-linux-aarch64.tar.gz"
      sha256 "7ba95fffaca069a429cb26198a5534dc1b31658da13ddd14bc3090f3b61e5503"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.5/tern-tools-0.0.5-linux-x86_64.tar.gz"
      sha256 "2ae131fafc55fe3b07ab6fea6f0dd8efeee98a2f55c7f7c4abe886617b1dba2d"
    end
  end

  def install
    bin.install "tern", "tern-cli"
    # One program, run as either by the name it's started with (as the Tern app and tern-install.sh set it up).
    bin.install_symlink "tern" => "tern-server"
    bin.install_symlink "tern" => "tern-connector"
    prefix.install "LICENSE", "NOTICE", "THIRD_PARTY_NOTICES"
  end

  def caveats
    <<~TXT
      Homebrew installs the programs only; it doesn't start the connector. To reach this computer through
      Tern Relay, set the connector up from the Tern app, or with tern-install.sh --connector.
    TXT
  end

  test do
    assert_match "tern #{version}", shell_output("#{bin}/tern --version")
    assert_match "tern-server #{version}", shell_output("#{bin}/tern-server --version")
    assert_match "tern-cli #{version}", shell_output("#{bin}/tern-cli --version")
  end
end
