
set -o vi
alias h=history
export LESS="-M -I -R -X"
HISTSIZE=99999

export PGPASSWORD=x
export PGDATABASE=test_db
export PGHOST=localhost
export PGUSER=test_user

if [ -f /sql/profile.sh ]; then
      . /sql/profile.sh
fi

