class ExonumJavaAT080 < Formula
  desc "Java runtime for Exonum blockchain"
  homepage "https://exonum.com"
  url "https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.8.0/exonum-java-0.8.0-release-Mac.zip"
  sha256 "acdaf6305d9af7b0efb3f5cd5de6d9e3fe2ada7a0efb00623b9068e125284fdb"

  depends_on :java
  depends_on "libsodium"

  def install
    prefix.install Dir["*"]
    ohai "Exonum Java App installed successfully."
    ohai "Installation location is #{prefix}"
    ohai "Use the following command to set EXONUM_HOME: "
    ohai "  export EXONUM_HOME=#{prefix}"
    ohai ""
    ohai "For basic documentation and usage instructions, see"
    ohai "#{prefix}/TUTORIAL.md"
    ohai "or"
    ohai "https://exonum.com/doc/version/latest/get-started/java-binding"
  end
end
