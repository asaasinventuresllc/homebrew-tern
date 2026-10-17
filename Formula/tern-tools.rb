class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.6/tern-tools-0.0.6-darwin-universal.tar.gz"
      sha256 "7774fa25d37ac826a54ef58a63bbb42aaa4a45945574d8200e6d2508019f119b"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.6/tern-tools-0.0.6-darwin-universal.tar.gz"
      sha256 "7774fa25d37ac826a54ef58a63bbb42aaa4a45945574d8200e6d2508019f119b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.6/tern-tools-0.0.6-linux-aarch64.tar.gz"
      sha256 "6b08aac760ef29c79584af587cb5c3420eec26b930f1d7ae12570380af096f97"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.6/tern-tools-0.0.6-linux-x86_64.tar.gz"
      sha256 "2d45f8dc8dfa128c1db200d6f9da66e377c16bf6fb3430cd5c6aa8daf4f4e51c"
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
