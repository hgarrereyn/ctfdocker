

echo "[*] Searching for container pu18"

# fetch container id
cid=$(docker ps | grep pu18 | awk '{split($0,a,"[ ]+"); print a[1]}')

if [ "$cid" == "" ]
then
    echo "[*] Container not found"
    
    if [ $# -ne 1 ]
    then
        echo "\nUsage: $0 <path/to/mount>"
        exit
    else
        echo "[*] Mounting $1"

        docker run \
            -it \
            -e "TERM=xterm-256color" \
            -p 8018:8018 \
            -v $1:/home/work \
            --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
            pu18 \
            /bin/bash
    fi
else
    echo "[*] Found running container: $cid"
    echo "[*] Spawning shell..."

    docker exec -it $cid /bin/bash
fi

