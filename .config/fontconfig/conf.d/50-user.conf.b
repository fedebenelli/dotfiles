<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <description>Load per-user customization files</description>
	<!--
	    Load per-user customization files where stored on XDG Base Directory
	    specification compliant places. it should be usually:
	      $HOME/.config/fontconfig/conf.d
	      $HOME/.config/fontconfig/fonts.conf
	-->
	  <include ignore_missing="yes" prefix="xdg">~/.config/fontconfig/conf.d</include>
	  <include ignore_missing="yes" prefix="xdg">~/.config/fontconfig/fonts.conf</include>
</fontconfig>
