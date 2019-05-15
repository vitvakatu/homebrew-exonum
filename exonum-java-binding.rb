class ExonumJavaBinding < Formula
  desc "Java Binding for the Exonum blockchain framework"
  homepage "http://exonum.com"
  url "https://github.com/vitvakatu/exonum-java-binding/releases/download/v0.7-test/exonum-java-0.7.0-SNAPSHOT-release.zip"
  sha256 "c0f220fc83790fa47633e665a28f4011098793606d2b3da39f5893b9685cf1c8"

  depends_on "rocksdb"
  depends_on "libsodium"
  depends_on :java

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"exonum-java"
  end

  test do
    system "false"
  end
end
