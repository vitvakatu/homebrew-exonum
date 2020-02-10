class ExonumJavaAT090Rc1 < Formula
  desc "Java runtime for Exonum blockchain"
  homepage "https://exonum.com"
  url "https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.9.0-rc1/exonum-java-0.9.0-rc1-release-Mac.zip"
  sha256 "b607fd8e2a4c15b6e8890a71826197b5ed70528ea209d5cf29e7f5f1da74eedb"

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
