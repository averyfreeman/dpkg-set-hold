# dpkg-set-hold

### A simple script for marking packages to hold back from package upgrades that meet a certain pattern criteria

I was inspired to make this script because I compiled `QEMU 5.1-rc3` and installed it over the package maintainer's version. I didn't want my newer version of `QEMU` to be removed during an upgrade, but I also didn't want to remove the references to the packages in `dpkg` in case I wanted to uninstall `QEMU` using `apt` later on.

The script takes a string for the package pattern you wish to hold back - you can make it as specific or broad as you like. I recommend you check `apt list --installed | grep <your string>` first to see how well your string filters out the results, then use that string to filter the installed packages to your liking in the script.
