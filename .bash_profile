# load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Todo.txt CLI
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
#export TODOTXT_DEFAULT_ACTION=ls
alias t="todo.sh"
complete -F _todo t
