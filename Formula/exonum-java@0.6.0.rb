class ExonumJavaAT060 < Formula
  desc "Java runtime for Exonum blockchain"
  homepage "https://exonum.com"
  url "https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.6.0/exonum-java-0.6.0-release-Mac.zip"
  sha256 "de4165d173bb2330a818183d3aad07bd81f61f9c1b5316725f9856b3c90a89ff"

  depends_on :java
  depends_on "libsodium"
# TODO: remove when ECR-3169 is closed
  depends_on "rocksdb5"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"exonum-java"
    ohai "Exonum Java App installed successfully."
    ohai "Installation location is #{prefix}"
    ohai "Use the following command to set EXONUM_HOME: "
    ohai "  export EXONUM_HOME=#{prefix}"
    ohai ""
    ohai "For basic documentation and usage instructions, see"
    ohai "#{prefix}/TUTORIAL.md"
    ohai "or"
    ohai "https://exonum.com/doc/version/latest/get-started/java-binding"
    ohai ""
    ohai "Exonum Java App requires a path to JVM to use in LD_LIBRARY_PATH"
    ohai "Please see the instructions at"
    ohai "https://exonum.com/doc/version/latest/get-started/java-binding/#installation"
  end

  test do
    java_home = %x[java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk '{print $3}'].strip
    java_lib_dir = `find #{java_home} -type f -name libjvm.\* | xargs -n1 dirname`.strip
    ohai java_lib_dir
    ENV["LD_LIBRARY_PATH"] = java_lib_dir
    ENV.delete "_JAVA_OPTIONS"
    (testpath/"services.toml").write <<-EOS
      [user_services]
      fake_service = "/fake/path"
    EOS
    system "exonum-java", "--help"
  end
end

