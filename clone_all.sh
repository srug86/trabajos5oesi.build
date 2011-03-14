PROTO=https://
HOST=iso2esi.googlecode.com/hg

modules=`cat $(dirname $0)/modules`

cd $(dirname $0)/..
echo Modules: $modules

for m in $modules; do
    echo -e "\n[ $m ]"
    if [ ! -d $m ]; then
        hg clone $PROTO$m.$HOST $m;
    else
 	hg --repository $m pull -u
    fi
done

# # create forest repo
# if [ ! -d .hg ]; then
#     hg init
#     hg clone http://hg.akoha.org/hgforest/

#     cat > .hg/hgrc << EOF
# [extensions]
# hgext.forest=./hgforest/forest.py
# EOF
# fi