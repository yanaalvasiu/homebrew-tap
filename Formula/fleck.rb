# SPDX-License-Identifier: GPL-3.0-or-later
class Fleck < Formula
  desc "Cautious all-in-one macOS utility CLI"
  homepage "https://github.com/yanaalvasiu/fleck"
  url "https://github.com/yanaalvasiu/fleck/archive/refs/heads/main.tar.gz"
  sha256 "852439fc97ba4b01d90ee785363052fa47cead6b3e129b2fc0cc901a7ac85cf8"
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
