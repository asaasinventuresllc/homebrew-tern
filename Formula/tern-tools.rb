class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.9/tern-tools-0.0.9-darwin-universal.tar.gz"
      sha256 "664054b52096324c2cc73cb7b81db2e2af645646b4ffa18bf9be9bbc32e511f1"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.9/tern-tools-0.0.9-darwin-universal.tar.gz"
      sha256 "664054b52096324c2cc73cb7b81db2e2af645646b4ffa18bf9be9bbc32e511f1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.9/tern-tools-0.0.9-linux-aarch64.tar.gz"
      sha256 "6731c488f6b45d895c2d77691b38f5c58fadf4c42c79fd0b9051bab563cc570c"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.9/tern-tools-0.0.9-linux-x86_64.tar.gz"
      sha256 "768931e23074c6c8a8dc2973953301e9010f94b7c6a65a1597f9e477900c4ddb"
    end
  end

  def install
    bin.install "tern", "tern-cli"
    # One program, run as either by the name it's started with (as the Tern app and tern-install.sh set it up).
    bin.install_symlink "tern" => "tern-server"
    bin.install_symlink "tern" => "tern-connector"
    prefix.install "LICENSE", "NOTICE", "THIRD_PARTY_NOTICES"
    # man tern: the same pages as "tern help" (Tern ADR 0022).
    (man1/"tern.1").write Utils.safe_popen_read(bin/"tern", "help", "--man")
  end

  def caveats
    <<~TXT
      Homebrew installs the programs only; it doesn't start the connector. To reach this computer through
      Tern Relay, set the connector up from the Tern app, or with tern-install.sh --connector.
      New to Tern? Run "tern tour" for a five-minute walkthrough, and "tern help" for everything else.
    TXT
  end

  test do
    assert_match "tern #{version}", shell_output("#{bin}/tern --version")
    assert_match "Session Eagle", shell_output("#{bin}/tern help")
    assert_match "tern-server #{version}", shell_output("#{bin}/tern-server --version")
    assert_match "tern-cli #{version}", shell_output("#{bin}/tern-cli --version")
  end
end
