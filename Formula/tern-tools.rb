class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.10/tern-tools-0.0.10-darwin-universal.tar.gz"
      sha256 "1b9fc92d25622cd46ba88d56898e66becb3c201e40a679152a3d523b934b0c3c"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.10/tern-tools-0.0.10-darwin-universal.tar.gz"
      sha256 "1b9fc92d25622cd46ba88d56898e66becb3c201e40a679152a3d523b934b0c3c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.10/tern-tools-0.0.10-linux-aarch64.tar.gz"
      sha256 "4ed525de98c953c49d47dbd4efe522aaedf3fb53dfca3202b9678967b4080704"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.10/tern-tools-0.0.10-linux-x86_64.tar.gz"
      sha256 "27167c51831ccf68a6cf5ce8dd16df0222e5a1855f2261386e78491481cfa1f2"
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
