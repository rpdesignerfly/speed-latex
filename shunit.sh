#!/bin/bash
#
# ./unit.sh
#
# Autor: Ricardo Pereira <rpdesignerfly@gmail.com>
# Site: https://github.com/rpdesignerfly/engenharia-de-software
#
#---------------------------------------------------------------------------------------------------
# Este programa executa os testes de unidade
#---------------------------------------------------------------------------------------------------

# cores
RED='\033[0;31m';
GREEN='\033[0;32m';
NORMAL='\033[0m';

# reinstala as bibliotecas
sudo ./uninstall.sh > /dev/null;
sudo ./install.sh > /dev/null;

root_path="$PWD";
tests_list=$(ls tests/*.sh);


echo "==========================================================";
echo "Executando testes de unidade";
echo "----------------------------------------------------------";

for test in "${tests_list}"; do

    # reseta a localização
    cd $root_path;
    # rm -Rf tests/temp/*

    # cria o arquivo de saida
    touch tests/temp/output.txt;

    # executa o teste
    result_text=$(./$test "$root_path" "$test_path");
    result_sign="$?";

    if [ "$result_sign" = "1" ]; then
        echo -e "${GREEN}[Ok] $result_text${NORMAL}";
    else
        echo -e "${RED}[Fail] $result_text${NORMAL}";
        echo "----------------------------------------------------------";
        echo "Output: ";
        cat tests/temp/output.txt;
    fi

    # remove arquivos temporários gerados pelos testes
    rm -Rf tests/temp/*

done

echo "==========================================================";