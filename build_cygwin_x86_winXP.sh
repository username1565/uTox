<<MULTISTRING_COMMENT
Begin the multistring comment.
    Compile uTox to win32 exe as x86 executable-file, which is working on windows XP.
	To do this, need cygwin with following installed packages:
		1. sh
		2. lynx
	
	How to run this?
	user@cygwin~ sh /cygdrive/c/pathway/this_file.sh

   (Warning!) To compile uTox for this file is enough to save and run.

End the multistring comment.
MULTISTRING_COMMENT

#	install packages, if not installed, else skip installation.
echo "Install cygwin packages, if this not installed."

# raw source code.
#lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg		#download apt-cyg source code - package manager for cygwin

# from my repositary:
lynx -source https://gist.githubusercontent.com/username1565/e1f1e3d51b1d1039bb782c8bb2e7cdc3/raw/14a60eaf4e0ead74c1c2c079a3ee208886a11d6d/apt-cyg > apt-cyg		#download apt-cyg source code - package manager for cygwin
# source code with description - here: https://gist.github.com/username1565/e1f1e3d51b1d1039bb782c8bb2e7cdc3

install apt-cyg /bin	#install binary, without source code, this already saved.
apt-cyg install wget	#install wget, to download zip-files with librariex.
apt-cyg install bsdtar	#install bsd-tar archiver to zip-unazip files.
apt-cyg install mingw64-i686-gcc-core	#install mingw gcc compiler if this still not installed, or skip.
apt-cyg install make					#install if not installed or skip
apt-cyg install cmake					#install if not installed or skip
apt-cyg install gdb						#same for this
apt-cyg install git						#git, to download source code from github.

#git clone --recursive git://github.com/uTox/uTox.git	#	clone and download uTox repositary.
#cd uTox		#libs must been downloaded, so don't use this.

file="README.md"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
	git clone --recursive git://github.com/username1565/uTox_winXP.git	#	clone and download uTox from my repositary to uTox_winXP
	cd uTox_winXP
fi


cd libs/windows-x32
sh get_libs_and_unzip_it.sh

echo "Check structure of folders for unpacked libraries. Is this correct?"
cd lib
cd ..
cd bin
cd ..
cd include
cd ..
cd share
cd ..
echo "Done"
sleep 1

echo "Back to the main folder."
cd ../..
echo "Done"
sleep 1

cd third-party
sh unzip_libraries.sh
echo "Done."
sh git_clone.sh			#When this already unzipped, then this will not be cloned.
echo "Done."
echo "back to the main directory"
cd ..
echo "Done."

echo "Change directory to \"build\"."
cd build
echo "Done."

echo "start precompiling for Windows XP in \"build\"-folder"
cmake __WIN_LEGACY=1 -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-win32.cmake" -DTOXCORE_STATIC=ON ..

echo "Start compilation utox_winXP.exe"
make

cd .. #back to the main folder.
