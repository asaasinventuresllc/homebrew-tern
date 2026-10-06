class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.2/tern-tools-0.0.2-darwin-universal.tar.gz"
      sha256 "6f16f6d757d2d23827fca110647503f8a2e67509fc3f815709c86cca7efb9f08"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.2/tern-tools-0.0.2-darwin-universal.tar.gz"
      sha256 "6f16f6d757d2d23827fca110647503f8a2e67509fc3f815709c86cca7efb9f08"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.2/tern-tools-0.0.2-linux-aarch64.tar.gz"
      sha256 "e771c44d2680978369db991f0da72f4d95e881b45ce27588725941b2401404e5"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.2/tern-tools-0.0.2-linux-x86_64.tar.gz"
      sha256 "b1b2321408e9f5a166bd077b2f08a2d84fbd8749f6c396e8efdff72addc15256"
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
