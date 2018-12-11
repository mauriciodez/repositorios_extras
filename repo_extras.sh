#!/bin/bash

#####	NOME:				repo_extras.sh
#####	VERSÃO:				1.0
#####	DESCRIÇÃO:			Gera lists para repositórios extras e baixa as chaves públicas.
#####	DATA DA CRIAÇÃO:	10/12/2018
#####	ESCRITO POR:		Maurício G. Paiva
#####	E-MAIL:				mauriciodez@gmail.com
#####	DISTRO:				Debian GNU/Linux 8 (jessie)
#####	LICENÇA:			GPLv3
#####	PROJETO:			https://github.com/mauriciodez/repo_extras.git

while read linha
do
SERVER1="pgp.mit.edu"
SERVER2="keyserver.ubuntu.com"
DIR="/etc/apt/sources.list.d"
D1=`echo "$linha" | awk -F'[\t]+' '{print $1}'`
D2=`echo "$linha" | awk -F'[\t]+' '{print $2}'`
D3=`echo "$linha" | awk -F'[\t]+' '{print $3}'`

echo "deb $D2" > $DIR/$D1.list && apt-key adv --keyserver $SERVER2 --recv-keys $D3

done < BD_rep_extras

apt update