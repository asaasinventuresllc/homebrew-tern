class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.7/tern-tools-0.0.7-darwin-universal.tar.gz"
      sha256 "e13a2ae93f9b2c77e336838500102068ac840ec288d8830237df8a40e7a88b46"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.7/tern-tools-0.0.7-darwin-universal.tar.gz"
      sha256 "e13a2ae93f9b2c77e336838500102068ac840ec288d8830237df8a40e7a88b46"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.7/tern-tools-0.0.7-linux-aarch64.tar.gz"
      sha256 "bdc1697dcd421b41d4db8ab16f17a0947560bd5fdd09f6097b0d910435a1813e"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.7/tern-tools-0.0.7-linux-x86_64.tar.gz"
      sha256 "60c55aab827686b0916417596024a10e12037b547b7a84880d353c116c725b67"
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
