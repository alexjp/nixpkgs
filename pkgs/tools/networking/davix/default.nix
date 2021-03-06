{ stdenv, fetchurl, cmake, pkgconfig, openssl, libxml2, boost, python3, libuuid }:

stdenv.mkDerivation rec {
  version = "0.7.2";
  name = "davix-${version}";
  nativeBuildInputs = [ cmake pkgconfig python3 ];
  buildInputs = [ openssl libxml2 boost libuuid ];

  # using the url below since the 0.7.2 release did carry a broken CMake file,
  # supposedly fixed in the next release
  # https://github.com/cern-fts/davix/issues/40
  src = fetchurl {
    url = "http://grid-deployment.web.cern.ch/grid-deployment/dms/lcgutil/tar/davix/${version}/davix-${version}.tar.gz";
    sha256 = "1w1q7r6r5j5f23ra4qhx3x29w9z9xal23c2azazpfmcz88hkkmhz";
  };


  meta = with stdenv.lib; {
    description = "Toolkit for Http-based file management";

    longDescription = "Davix is a toolkit designed for file
    operations with Http based protocols (WebDav, Amazon S3, ...).
    Davix provides an API and a set of command line tools";

    license     = licenses.lgpl2Plus;
    homepage    = http://dmc.web.cern.ch/projects/davix/home;
    maintainers = [ maintainers.adev ];
    platforms   = platforms.all;
  };
}

