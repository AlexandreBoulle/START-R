#!/bin/bash

docker pull tdenecker/start-r

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

echo '#!/bin/bash' > $BASEDIR/START-R_analyzer.sh
echo 'docker stop $(docker ps -a -q)' >> $BASEDIR/START-R_analyzer.sh
echo 'docker run --rm -p 3838:3838 -v' $BASEDIR'/START-R_analyzer:/srv/shiny-server tdenecker/start-r' >> $BASEDIR/START-R_analyzer.sh

echo '#!/bin/bash' > $BASEDIR/START-R_viewer.sh
echo 'docker stop $(docker ps -a -q)' >> $BASEDIR/START-R_viewer.sh
echo 'docker run --rm -p 3838:3838 -v' $BASEDIR'/START-R_viewer:/srv/shiny-server tdenecker/start-r' >> $BASEDIR/START-R_viewer.sh

chmod +x $BASEDIR/START-R_analyzer.sh
chmod +x $BASEDIR/START-R_viewer.sh
