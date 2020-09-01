echo "
########################################################
# install true color
########################################################
"
CDIR=$(cd $(dirname ${BASH_SOURCE:-${0}}); pwd)
tic -x -o ~/.terminfo ${CDIR}/../src/terminfo-24bit.src
