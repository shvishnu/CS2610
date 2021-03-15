rm f1.txt
touch f1.txt
for i in {0..40}
do
    touch number.txt
    echo "$i" > number.txt
    ./CS19B045_1 < number.txt >> f1.txt
done
    rm number.txt
