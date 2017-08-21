class I386JosElfGdb < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2014/tools.html"
  url "http://ftpmirror.gnu.org/gdb/gdb-7.3.1.tar.bz2"
  sha256 "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-jos-elf",
                          "--program-prefix=i386-jos-elf-",
                          "--disable-nls",
                          "--disable-werror"
    system "make", "all"
    system "make", "install"
    # avoid conflict with binutil
    if Formula["i386-jos-elf-binutils"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/i386-jos-elf-gdb -v"
  end
end
