Let's say we want to count how many occurrences of each word exists within a file.

`cat subtitles_dutch.txt | xargs | tr ' ' '\n' | sort | uniq -c | sort -nr`
