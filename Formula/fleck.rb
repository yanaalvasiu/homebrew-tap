# SPDX-License-Identifier: GPL-3.0-or-later
class Fleck < Formula
  desc "Cautious all-in-one macOS utility CLI"
  homepage "https://github.com/yanaalvasiu/fleck"
  url "https://github.com/yanaalvasiu/fleck/archive/ecbdc16d9c934faad8ae7d5b124eeea2901d8451.tar.gz"
  sha256 "2fbc46f3566cebf38a85fb736b3b7dd6cebd89c07dbaa1630384a230b2b1b4c9"
  version "0.1.5"
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
