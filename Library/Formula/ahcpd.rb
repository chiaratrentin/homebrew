require 'formula'

class Ahcpd < Formula
  homepage 'http://www.pps.univ-paris-diderot.fr/~jch/software/ahcp/'
  url 'http://www.pps.univ-paris-diderot.fr/~jch/software/files/ahcpd-0.53.tar.gz'
  sha1 '0d8ad31785357758abeb371f0431dbe08718af92'

  def patches
    # fixes man path for homebrew
    DATA
  end

  def install
    system "make", "LDLIBS=''"
    system "make", "install", "PREFIX=", "TARGET=#{prefix}"
  end
end

__END__
diff --git a/Makefile b/Makefile
index e52eeb7..28e1043 100644
--- a/Makefile
+++ b/Makefile
@@ -40,8 +40,8 @@ install.minimal: all
	chmod +x $(TARGET)/etc/ahcp/ahcp-config.sh

 install: all install.minimal
-	mkdir -p $(TARGET)$(PREFIX)/man/man8/
-	cp -f ahcpd.man $(TARGET)$(PREFIX)/man/man8/ahcpd.8
+	mkdir -p $(TARGET)$(PREFIX)/share/man/man8/
+	cp -f ahcpd.man $(TARGET)$(PREFIX)/share/man/man8/ahcpd.8

 .PHONY: uninstall

@@ -49,7 +49,7 @@ uninstall:
	-rm -f $(TARGET)$(PREFIX)/bin/ahcpd
	-rm -f $(TARGET)$(PREFIX)/bin/ahcp-config.sh
	-rm -f $(TARGET)$(PREFIX)/bin/ahcp-dummy-config.sh
-	-rm -f $(TARGET)$(PREFIX)/man/man8/ahcpd.8
+	-rm -f $(TARGET)$(PREFIX)/share/man/man8/ahcpd.8

 .PHONY: clean
