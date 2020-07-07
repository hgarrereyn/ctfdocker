

echo "[*] Searching for container pu16"

# fetch container id
cid=$(docker ps | grep pu16 | awk '{split($0,a,"[ ]+"); print a[1]}')

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
            -p 8016:8016 \
            -p 8889:8889 \
            -p 9998:9998 \
            -v $1:/home/work \
            -v ~/ctf/_custom/pwndbg:/pwndbg \
            --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
            pu16 \
            /bin/bash
    fi
else
    echo "[*] Found running container: $cid"
    echo "[*] Spawning shell..."

    docker exec -it $cid /bin/bash
fi

