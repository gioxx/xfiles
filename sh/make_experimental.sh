cp contrib/xfiles_* ./
for s in xfiles_*; do (head -n 1 "${s}" && tail -n +2 "${s}" | sort) > "sorted_${s}"; done
for f in sorted_*; do (cat "${f}") >> experimental.txt; done
