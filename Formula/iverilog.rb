# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Iverilog < Formula
  desc "Icarus Verilog"
  homepage "http://iverilog.icarus.com"
  url "https://github.com/steveicarus/iverilog/archive/refs/tags/v11_0.tar.gz"
  version "11.0"
  sha256 "6327fb900e66b46803d928b7ca439409a0dc32731d82143b20387be0833f1c95"
  license "GPL-2.0"

  depends_on "readline"
  depends_on "gperf"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "`which sh` ./autoconf.sh"
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test iverilog`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
