while read line; do
    name=$(echo "$line" | cut -d : -f1)
    id=$(echo "$line" | cut -d : -f2)
    desc=$(echo "$line" | cut -d : -f3-)

    echo "$id: $name is $desc"
done < data.txt
