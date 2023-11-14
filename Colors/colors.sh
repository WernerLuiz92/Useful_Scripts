styles=(0 1 2 3 4 5 6 7 8 9)
foregrounds=(30 31 32 33 34 35 36 37 39 90 91 92 93 94 95 96 97)
backgrounds=(40 41 42 43 44 45 46 47 49 100 101 102 103 104 105 106 107)

for st in "${styles[@]}"; do
    for fg in "${foregrounds[@]}"; do
        for bg in "${backgrounds[@]}"; do
            echo -ne "\e[$st;$fg;$bg""m\\\e[$st;$fg;$bg""m\e[0m "
        done
        echo
    done
done
echo ""