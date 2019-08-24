# Timothy Gaede
# last updated 2019-08-23
#───────────────────────────────────────────────────────────────────────────────
function inSorted(val, a)
# array must be sorted lo-to-high
    lo = 1
    hi = length(a)

    fnd = false # number found in array

    while lo ≤ hi  &&   !fnd
        mid = lo + (hi - lo) ÷ 2

        if     a[mid] == val;   fnd = true
        elseif a[mid] <  val;   lo = mid + 1
        else                    hi = mid - 1
        end
    end

    fnd
end
#───────────────────────────────────────────────────────────────────────────────

#───────────────────────────────────────────────────────────────────────────────
function reversables(words)
    revbles = []
    len_max = 0
    for w in words
        if inSorted(reverse(w), words)
            push!(revbles, w)
            if length(w) > len_max;    len_max = length(w); end
        end
    end

    revbles, len_max
end
#───────────────────────────────────────────────────────────────────────────────


#═══════════════════════════════════════════════════════════════════════════════
function main()
    # Save words.txt from:
    # https://github.com/BenLauwens/ThinkJulia.jl/blob/master/data/words.txt
    words = []

    path = "C:/Users/TimGa/JL/Think Julia/Chapter 09/words.txt"
    open(path, "r") do f
        for line in eachline(f)
          push!(words, line)
        end
    end

    words_revble, len_max = reversables(words)

    println("Words that reverse into another word:\n\n")
    for w in words_revble
        println(lpad(w, len_max), " ⬅➡ ", reverse(w))
    end
    count = length(words_revble)
    println("\n"^3, "There are $count reversable words from the list.")
    if length(words_revble) % 2 == 1
        println("The number of reversable words is odd due to palindromes.")
    end

    words_pal = []
    for w in words_revble
        if w == reverse(w);    push!(words_pal, w); end
    end

    if length(words_pal) > 0
        println("\n"^3, "There are ", length(words_pal), " palindromic words:")
        for w in words_pal;    println(w); end
    end

end
#═══════════════════════════════════════════════════════════════════════════════
main()
