require 'formula'

class Libfreenect < Formula
  head 'https://github.com/OpenKinect/libfreenect.git'
  url 'https://github.com/OpenKinect/libfreenect/tarball/v0.1.1'
  md5 'bf874e29274171a89520c80de9795cbd'
  homepage 'http://openkinect.org'

  depends_on 'libusb' #head
  depends_on 'cmake' => :build

  def install
    mkdir "build"
    cd "build"
    system "cmake .. #{std_cmake_parameters}"
    system "make install"
  end

  def test
    system "glview"
  end

  def caveats; <<-EOS.undent
    Due to some bugs in libusb's release, this formula
    requires libusb's HEAD, to install it do:
    `brew install libusb --HEAD`
    EOS
  end

end
