Sum each line and display the max sum

`cat numbers.txt | tr ' ' '+' | bc | sort -nr | head -1`