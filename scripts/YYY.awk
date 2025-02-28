
{
    for (i = 1; i <= NF; i++) {
        freq[$i]++
    }
}

END {
    for (word in freq) {
        print freq[word], word
    }
}
