#!/bin/sh
#
#	Audio switch script for cubie2vdr
#

audio=$1
if [ audio == "analog"]; then
	echo "PULSE-AUDIO: Klinke ..."
	echo "set-default-sink alsa_output.platform-sunxi-codec.analog-stereo" | pacmd
else
	echo "PULSE-AUDIO: Hdmi ..."
  	echo "set-default-sink alsa_output.platform-sunxi-sndhdmi.0.analog-stereo" | pacmd
fi

sudo /vdr.sh 'audio'
