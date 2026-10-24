# SPDX-License-Identifier: GPL-3.0-or-later
class Fleck < Formula
  desc "Cautious all-in-one macOS utility CLI"
  homepage "https://github.com/yanaalvasiu/fleck"
  url "https://github.com/yanaalvasiu/fleck/archive/1949141.tar.gz"
  sha256 "17e24cdbdd2c7a91bab3103bf320776dd1c506c20ed665ddfbded9762ca93e1e"
  version "0.1.9"
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
