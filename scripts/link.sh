cd dots/

dotDir=$(pwd)

for file in $(ls); do
    dest="$HOME/.$file"
    bkp=$(date +%Y-%m-%d-%H%M)

    if [ -h "$dest" ]; then
        echo "Removing link: $dest"
        rm ${dest}
    elif [ -f "$dest" ]; then
        echo "Backuping file: $dest"
        mv $dest{,.$bkp}
    elif [ -d "${dest}" ]; then
        echo "Backuping dir: $dest"
        mv $dest{,.$bkp}
    fi

    echo "New link: $dest"
    ln -s $dotDir/$file $dest
done
