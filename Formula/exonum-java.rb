class ExonumJava < Formula
  desc "Java runtime for Exonum blockchain"
  homepage "https://exonum.com"
  url "https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.6.0/exonum-java-0.6.0-release-Mac.zip"
  sha256 "de4165d173bb2330a818183d3aad07bd81f61f9c1b5316725f9856b3c90a89ff"

  depends_on :java
  depends_on "libsodium"
  depends_on "rocksdb"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"exonum-java"
  end

  test do
    system "true"
  end
end
