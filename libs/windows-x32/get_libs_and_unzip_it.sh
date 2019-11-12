echo "check packages, and install if not exists..."
apt-cyg install wget	#install wget, to download zip-files with libraries if this does not exists.
apt-cyg install bsdtar	#install bsd-tar archiver to zip-unazip this zip-files.
echo "Done."
sleep 1

#	download packages there, if this does not exists
echo "Download libraries zip-files, if does not exists"
wget --no-clobber https://build.tox.chat/view/libtoxcore/job/libtoxcore-toktok_build_windows_x86_static_release/lastSuccessfulBuild/artifact/libtoxcore-toktok_build_windows_x86_static_release.zip
wget --no-clobber https://build.tox.chat/view/libopenal/job/libopenal_build_windows_x86_static_release/lastSuccessfulBuild/artifact/libopenal_build_windows_x86_static_release.zip
wget --no-clobber https://build.tox.chat/view/libsodium/job/libsodium_build_windows_x86_static_release/lastSuccessfulBuild/artifact/libsodium_build_windows_x86_static_release.zip
wget --no-clobber https://build.tox.chat/view/libvpx/job/libvpx_build_windows_x86_static_release/lastSuccessfulBuild/artifact/libvpx_build_windows_x86_static_release.zip
wget --no-clobber https://build.tox.chat/view/libopus/job/libopus_build_windows_x86_static_release/lastSuccessfulBuild/artifact/libopus_build_windows_x86_static_release.zip
wget --no-clobber https://build.tox.chat/view/libfilteraudio/job/libfilteraudio_build_windows_x86_static_release/lastSuccessfulBuild/artifact/libfilteraudio.zip
echo "Done."
sleep 1

echo "Unzip zip-files, using bsdtar archiver";
#	unzip it in this filder by this sequence:
bsdtar xf libtoxcore-toktok_build_windows_x86_static_release.zip
bsdtar xf libopenal_build_windows_x86_static_release.zip
bsdtar xf libsodium_build_windows_x86_static_release.zip
bsdtar xf libvpx_build_windows_x86_static_release.zip
bsdtar xf libopus_build_windows_x86_static_release.zip
bsdtar xf libfilteraudio.zip
echo "Done.";
sleep 1
