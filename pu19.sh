

echo "[*] Searching for container pu19"

# fetch container id
cid=$(docker ps | grep pu19 | awk '{split($0,a,"[ ]+"); print a[1]}')

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
            -p 9000:9000 \
            -p 8019:8019 \
            -v $1:/home/work \
            --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
            pu19 \
            /bin/bash
    fi
else
    echo "[*] Found running container: $cid"
    echo "[*] Spawning shell..."

    docker exec -i $cid /bin/bash
fi

