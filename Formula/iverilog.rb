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
    system "`which sh` ./autoconf.sh"
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
