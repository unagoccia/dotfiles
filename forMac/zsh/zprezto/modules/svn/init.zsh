# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

alias svnlog='svn log --limit 10 -v'
alias svndiffg='svn diff --diff-cmd fmdiff'
alias svnaddall='(){
    extention=$2
    svn st $1 | awk -v "ext=$extention" '\'' match($1, "?") && match($2, ext) { print $2 } '\''
    
    echo -n "\ncontinue?(y/n):"
    read isContinue
    
    if test ${isContinue} = "y"; then
        svn st $1 | awk -v "ext=$extention" '\'' match($1, "?") && match($2, ext) { print $2 } '\'' | xargs svn add
    fi
}'
