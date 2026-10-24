# SPDX-License-Identifier: GPL-3.0-or-later
class Fleck < Formula
  desc "Cautious all-in-one macOS utility CLI"
  homepage "https://github.com/yanaalvasiu/fleck"
  url "https://github.com/yanaalvasiu/fleck/archive/9131cb3555074eb4cb8ff8d70306e3c0aabfcc30.tar.gz"
  sha256 "3948452a8e437f22f4430c857581e441d73846e6fc6b71fc79e870468c72014c"
  version "0.1.4"
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
