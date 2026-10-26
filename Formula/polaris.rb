# Written by itsmycargo/polaris-cli-releases on each release; don't edit.
class Polaris < Formula
  desc "Command-line tool for ItsMyCargo freight quotes, bookings and tracking"
  homepage "https://github.com/itsmycargo/polaris-cli-releases"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/itsmycargo/polaris-cli-releases/releases/download/v0.1.0/polaris_0.1.0_darwin_arm64.tar.gz"
      sha256 "d5fc1b92c5fb439a6c6e344a68ef1bc2f7bd6437e560ba2117c8e41fa7aa0c1e"
    end
    on_intel do
      url "https://github.com/itsmycargo/polaris-cli-releases/releases/download/v0.1.0/polaris_0.1.0_darwin_amd64.tar.gz"
      sha256 "9a215542cef4c6567d513892464cc359c43925fef7b49f6cf395680d8c33b334"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/itsmycargo/polaris-cli-releases/releases/download/v0.1.0/polaris_0.1.0_linux_arm64.tar.gz"
      sha256 "624c3a503f0286374eb82d78cfe931573adae80833142fb016f02401183a9a06"
    end
    on_intel do
      url "https://github.com/itsmycargo/polaris-cli-releases/releases/download/v0.1.0/polaris_0.1.0_linux_amd64.tar.gz"
      sha256 "ac57ec597565e5441d1a374bf2ac49fc87c089a34df5c68eff0b6bbc87c77012"
    end
  end

  def install
    bin.install "polaris"
    generate_completions_from_executable(bin/"polaris", "completion")
  end

  def caveats
    <<~EOS
      To teach Claude Code or Codex to use polaris, install its agent skill:
        polaris skill install
      and again after each upgrade.
    EOS
  end

  test do
    assert_equal "polaris #{version}", shell_output("#{bin}/polaris version").strip
  end
end
