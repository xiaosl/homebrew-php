require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Stomp < AbstractPhp55Extension
  init
  homepage "http://pecl.php.net/package/stomp"
  url "http://pecl.php.net/get/stomp-1.0.8.tgz"
  sha256 "9cf4180a816bac08300c45083410ca536200bd4940db0174026b9a825161f159"
  head "https://github.com/JosephMoniz/php-stomp.git"


  bottle do
    cellar :any_skip_relocation
    revision 1
    sha256 "44ffc652615b0d5279a4a6b4a17c890efc41f2150b1d718b2dfac38c826ee417" => :el_capitan
    sha256 "3d41384e4d5072f3dcc56127f298fff32b52f4167fd379d618003c5474e84634" => :yosemite
    sha256 "a1e78657ee4a318092a8af298ef63ac511dc2db38a85b3e13ebfeffb5c968aac" => :mavericks
  end

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