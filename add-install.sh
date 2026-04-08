#!/bin/bash

pkg=$1

script=install-$pkg.sh

if [ ! -F $script]; then
  echo "#!/bin/bash" > $script
  echo "" >> $script
  echo "omarchy-pkg-add $pkg" >> $script
  chmod +x $script
  git add $script
  echo "echo '-> Installing $pkg'" >> install-all.sh
  echo "./$script" >> install-all.sh
  git commit -a -m "Added script for installing $pkg"
fi



