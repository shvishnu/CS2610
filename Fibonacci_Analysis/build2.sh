rm f2.txt
touch f2.txt
for i in {0..40}
do
    touch number.txt
    echo "$i" > number.txt
    ./CS19B045_2 < number.txt >> f2.txt
done
    rm number.txt
