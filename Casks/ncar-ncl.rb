cask 'ncar-ncl' do

  if MacOS.version == :mountain_lion
    version '6.3.0'
    sha256 '154914834df0eeb69b778698062900175a5dcc88dcd76545cc2c504551cd756a'
    url 'https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=e0852fc5-cd9a-11e4-bb80-00c0f03d5b7c'
  elsif MacOS.version == :mavericks
    version '6.3.0'
    sha256 'abe78b6830c43f8056cad02f5fbcbf4de82c4948b95b757b0d8a72d4776cbbf6'
    url 'https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=e0849384-cd9a-11e4-bb80-00c0f03d5b7c'
  elsif MacOS.version == :yosemite
    version '6.3.0'
    sha256 'b0a7a02d1044380b6f33d274ccd0e870e06f11fbb98e72a58844eee98c98ff8d'
    url 'https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=e085cc06-cd9a-11e4-bb80-00c0f03d5b7c'
  elsif MacOS.version == :el_capitan
    version '6.4.0'
    sha256 '75e340118cdbbabd1b9ef5e4f40d75cc3d71c657585e34e24daaa25a727dd600'
    url 'https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=d82e7332-0cc6-11e7-9b99-00c0f03d5b7c'
  else
    version '6.4.0'
    sha256 '3db9396a6b33eff1a5d31b8e4d41eeac17f459a2740b614131fbbe943bc76a3c'
    url 'https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=0a459666-fa02-11e6-a976-00c0f03d5b7c'
  end

  appcast 'https://www.ncl.ucar.edu/current_release.shtml',
          checkpoint: '22664b421b3ba0e5e389f6b2898c2ef226462892642ad1a79ec1b591fba0679c'
  name 'NCAR Command Language'
  name 'ncl'
  homepage 'https://www.ncl.ucar.edu/'

  depends_on cask: 'xquartz'
  depends_on formula: 'gcc'
  depends_on macos: '>= :mountain_lion'

  artifact 'include', target: "/usr/local/ncl-#{version}/include"
  artifact 'bin', target: "/usr/local/ncl-#{version}/bin"
  artifact 'lib', target: "/usr/local/ncl-#{version}/lib"

  caveats <<-EOS.undent
    To use ncar-ncl, you must add the $NCARG_ROOT/bin directory
    to your PATH environment variable.

    For bash shell, add these lines to ~/.bash_profile:

      export NCARG_ROOT=/usr/local/ncl-#{version}
      export PATH=$NCARG_ROOT/bin:"$PATH"

    You may also need to modify your DYLD_FALLBACK_LIBRARY_PATH
    environment variable:

    export DYLD_FALLBACK_LIBRARY_PATH=$(dirname $(gfortran --print-file-name libgfortran.3.dylib)):$DYLD_FALLBACK_LIBRARY_PATH

    For other information, please see:
    https://www.ncl.ucar.edu/Download/macosx.shtml
  EOS
end
