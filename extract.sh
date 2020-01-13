password=$1
cd colabResources
echo $password | gpg-zip -d PySCIPOpt.gpg

$descriptorspec = array(
    0 => array("pipe", "r"),
    1 => array("pipe", "w"),
    2 => array("pipe", "w"),
    3 => array("pipe", "r"),
);

$pipes = false;
$process = proc_open("gpg -v --clearsign --no-tty --passphrase-fd 3", $descriptorspec, $pipes);

if(is_resource($process)) {
    fwrite($pipes[3], $passphrase);
    fclose($pipes[3]);

    fwrite($pipes[0], $text);
    fclose($pipes[0]);

    $output = stream_get_contents($pipes[1]);
    $stderr = stream_get_contents($pipes[2]);

    fclose($pipes[1]);
    fclose($pipes[2]);

    $retval = proc_close($process);

    echo "retval = $retval\n";
    echo "output= $output\n";
    echo "err= $stderr\n";
}

