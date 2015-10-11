require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Stomp < AbstractPhp56Extension
  init
  homepage "http://pecl.php.net/package/stomp"
  url "http://pecl.php.net/get/stomp-1.0.8.tgz"
  sha256 "4e75c7baeff1de84b806a3fc17f486f773a8fd94797390c0678a11f71abf16c1"
  head "https://github.com/JosephMoniz/php-stomp.git"


  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/stomp.so"
    write_config_file if build.with? "config-file"
  end
end