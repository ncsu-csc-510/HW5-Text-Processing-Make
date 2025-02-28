BEGIN {
    if (PASS == 1) {
        # Read top words into an array
        while ((getline word < ARGV[2]) > 0) {
            top_words[++n] = word
        }
        close(ARGV[2])
    } else if (PASS == 2) {
        # Print header
        for (i = 1; i <= n; i++) {
            printf "%s%s", top_words[i], (i < n ? "," : "\n")
        }
        # Process paragraphs
        paragraph = ""
        while ((getline line < ARGV[2]) > 0) {
            if (line == "") {
                # End of paragraph
                if (paragraph != "") {
                    # Count word frequencies
                    split(paragraph, words, " ")
                    for (i = 1; i <= n; i++) {
                        count = 0
                        for (j in words) {
                            if (words[j] == top_words[i]) {
                                count++
                            }
                        }
                        printf "%d%s", count, (i < n ? "," : "\n")
                    }
                    paragraph = ""
                }
            } else {
                paragraph = paragraph " " line
            }
        }
    }
}
