class ExonumJava < Formula
  desc "Java runtime for Exonum blockchain"
  homepage "https://exonum.com"
  url "https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.7.0/exonum-java-0.7.0-release-Mac.zip"
  sha256 "55e8337d2d10c114bcd31e59f9bf4fffbd9522579a074bd2de29767d26f1bcfb"
  revision 1

  depends_on :java
  depends_on "libsodium"

  def install
    prefix.install Dir["*"]
    ohai "Exonum Java App installed successfully."
    ohai "Installation location is #{prefix}"
    ohai "Use the following command to set PATH: "
    ohai "  export PATH=$PATH:#{prefix}/bin"
    ohai ""
    ohai "For basic documentation and usage instructions, see"
    ohai "#{prefix}/TUTORIAL.md"
    ohai "or"
    ohai "https://exonum.com/doc/version/latest/get-started/java-binding"
  end

  test do
    ENV.delete "_JAVA_OPTIONS"
    (testpath/"services.toml").write <<-EOS
      [user_services]
      fake_service = "/fake/path"
    EOS
    system "exonum-java", "--help"
  end
end
