#!/bin/bash

pkg=$1

script=install-$pkg.sh

if [[ -f $script ]]; then
  echo "$script does already exists"
else
  echo "#!/bin/bash" > $script
  echo "" >> $script
  echo "omarchy-pkg-add $pkg" >> $script
  chmod +x $script
  git add $script
  echo "echo '  -> Installing $pkg'" >> install-all.sh
  echo "./$script" >> install-all.sh
fi
