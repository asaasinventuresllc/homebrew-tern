class TernTools < Formula
  desc "Tern's shell server and connector, and the tern-cli command-line tool"
  homepage "https://github.com/asaasinventuresllc/Tern"
  license "Apache-2.0"

  # The macOS build is universal, so both CPU branches point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.4/tern-tools-0.0.4-darwin-universal.tar.gz"
      sha256 "0ae66e20f37f7858a8529afd466132556e606aeca70fffe2d29d259246ba523b"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.4/tern-tools-0.0.4-darwin-universal.tar.gz"
      sha256 "0ae66e20f37f7858a8529afd466132556e606aeca70fffe2d29d259246ba523b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.4/tern-tools-0.0.4-linux-aarch64.tar.gz"
      sha256 "ba8585fefaa0126db6f438ba91caf0cbda5d12a701528b57c32de57d81278d7a"
    end
    on_intel do
      url "https://github.com/asaasinventuresllc/Tern/releases/download/v0.0.4/tern-tools-0.0.4-linux-x86_64.tar.gz"
      sha256 "bf02e3bb3c0322eea8d731d11390188e911185e5c5923b8fc11b840539cc262b"
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
