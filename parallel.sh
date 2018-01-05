parallel ./mygrep.sh {}/job00.{}.log {} ::: `seq --format="%02g" 1 20`     
