class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.1/tern-tools-0.0.1-darwin-universal.tar.gz"
      sha256 "b067b5104019fd521db3a9609a537755fb1f42925fdb3f01afce48259b41517e"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.1/tern-tools-0.0.1-darwin-universal.tar.gz"
      sha256 "b067b5104019fd521db3a9609a537755fb1f42925fdb3f01afce48259b41517e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.1/tern-tools-0.0.1-linux-aarch64.tar.gz"
      sha256 "68596c41262377cbaa0f10d50dcea6f24fa2befee24a298739af9e5733bd348b"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.1/tern-tools-0.0.1-linux-x86_64.tar.gz"
      sha256 "7c3cf7652254d4a21d0650390e039a44ef53c08b765e5cc33db9098fa1f41f06"
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
