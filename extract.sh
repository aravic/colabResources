password=$1
openssl enc -d -aes-192-cbc -in 'PySCIPOpt.openssl' -out PySCIPOpt.tar.gz -pass "pass:$password"

cd PySCIPOpt/ && ./install.sh
cd ../
