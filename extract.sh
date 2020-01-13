password=$1
cd colabResources
echo $password | gpg-zip -d PySCIPOpt.gpg
