# ZZZ.awk

BEGIN {
    # Nothing special to do at startup.
}

{
    if (PASS == 1) {
        n++
        top[n] = $0
        topIndex[$0] = n
    }

    else if (PASS == 2) {

        if (FNR == 1) {
            for (i = 1; i <= n; i++) {
                printf "%s,", top[i]
            }
            printf "\n"
        }

        split($0, words, " ")

        for (i = 1; i <= n; i++) {
            freq[i] = 0
        }

        for (j in words) {
            w = words[j]
            if (w in topIndex) {
                freq[topIndex[w]]++
            }
        }

        for (i = 1; i <= n; i++) {
            printf "%d,", freq[i]
        }
        printf "\n"
    }
}

END {
    # Nothing 
}
