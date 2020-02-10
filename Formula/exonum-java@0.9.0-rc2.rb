class ExonumJavaAT090Rc2 < Formula
  desc "Java runtime for Exonum blockchain"
  homepage "https://exonum.com"
  url "https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.9.0-rc2/exonum-java-0.9.0-rc2-release-Mac.zip"
  sha256 "0c37e7093e3596a77e599c8dab4252240306b3d39b6fa72fa679a5da81ebf525"

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
    ohai "https://exonum.com/doc/version/latest/get-started/java-binding"
  end
end
