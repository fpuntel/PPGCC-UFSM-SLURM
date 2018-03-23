#!/bin/bash

sshSucess=0

while test $sshSucess -ne 1
do
        echo -n "Testando a conexao...."
        date
        ssh -q -o BatchMode=yes -o ConnectTimeout=10000 adminlcce@200.132.24.196 exit

        if test $? -ne 0 
        then
                echo -n "Sem conexao: "  >> conexaoSSH.log
                date >> conexaoSSH.log
        else
                echo -n "Com conexao: "  >> conexaoSSH.log
                date >> conexaoSSH.log
                sshSucess=1
        fi

        sleep 60
done

