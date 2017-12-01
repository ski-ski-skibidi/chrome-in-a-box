docker run -it --rm \
	--net host \
	--cpuset-cpus 0 \
	--memory 512mb \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	-v $HOME/Downloads:/home/chrome/Downloads \
	--security-opt seccomp=chrome.json \
	--device /dev/snd \
	-v /dev/shm:/dev/shm \
	--name chrome \
	chrome
