class Gtkwave < Formula
  desc "GTKWave is a fully featured GTK+ based wave viewer for Unix and Win32 which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing."
  homepage "http://gtkwave.sourceforge.net/"
  url "http://gtkwave.sourceforge.net/gtkwave-3.3.111.tar.gz"
  version "3.3.111"
  sha256 "f6e6046674033e5bab6e4e2720d6bd7dba70b23f329614191b029e06c57ec296"
  license "GPL-v2"

  depends_on "gtk+"
  depends_on "gperf"
  depends_on "tcl-tk"
  depends_on "zlib"
  depends_on "bzip2"
  depends_on "shared-mime-info"

  def install
    system "./configure", *std_configure_args, 
                          "--disable-silent-rules",
                          "--disable-mime-update",
                          "--with-tk=#{HOMEBREW_PREFIX}/lib",
                          "--with-tcl=#{HOMEBREW_PREFIX}/lib",
                          "LIBZ_CFLAGS=-L#{Formula["zlib"].opt_include}",
                          "LIBBZ2_CFLAGS=-L#{Formula["bzip2"].opt_include}"
                          # "LDFLAGS=-L#{HOMEBREW_PREFIX}/lib -Wl,-rpath-link,#{HOMEBREW_PREFIX}/lib"
                          # "XDG_DATA_DIRS=#{prefix}/share:$XDG_DATA_DIRS"
    system "make", "install"
  end

  def post_install
    system "#{Formula["share-mime-info"].opt_bin}/update-mime-datebase", "#{HOMEBREW_PREFIX}/share/mime"
    system "/usr/bin/update-desktop-database", "#{HOMEBREW_PREFIX}/share/applications"
  end

  test do
    system "false"
  end
end
