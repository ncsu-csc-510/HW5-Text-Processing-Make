{
    # Loop through each word in the line
    for (i = 1; i <= NF; i++) {
        # Check if the word is NOT a stop word
        if ($i !~ /^(is|the|in|but|can|a|the|is|in|of|to|a|that|it|for|on|with|as|this|was|at|by|an|be|from|or|are)$/) {
            # Print the word if it's not a stop word
            printf "%s ", $i
        }
    }
    # Print a newline at the end of each paragraph
    print ""
}