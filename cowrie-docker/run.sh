docker run -d --restart=always -p 22:2222 -p 23:2223 -p 2323:2323 -p 5358:5358 -p 5555:5555 -p 7547:7547 -v etc:/cowrie/cowrie-git/etc -v var:/cowrie/cowrie-git/var -v log:/cowrie/cowrie-git/log -v data:/cowrie/cowrie-git/data -v honeyfs:/cowrie/cowrie-git/honeyfs -v dl:/cowrie/cowrie-git/dl -v txtcmds:/cowrie/cowrie-git/txtcmds cowrie
