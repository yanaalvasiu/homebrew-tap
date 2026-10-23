# SPDX-License-Identifier: GPL-3.0-or-later
class Fleck < Formula
  desc "Cautious all-in-one macOS utility CLI"
  homepage "https://github.com/yanaalvasiu/fleck"
  url "https://github.com/yanaalvasiu/fleck/archive/refs/heads/main.tar.gz"
  sha256 "cc87a34b4c00109d01a980f9edf265055882e84b2d291ddfb015f91ae1678185"
  version "0.0.0"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version} -X main.commit=homebrew -X main.buildDate=formula"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"fleck", "./cmd/bin"
  end

  test do
    assert_match "fleck", shell_output("#{bin}/fleck --help")
  end
end
