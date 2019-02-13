#!/bin/bash
#
# ./devel.sh
#
# Autor: Ricardo Pereira <rpdesignerfly@gmail.com>
# Site: https://github.com/rpdesignerfly/engenharia-de-software
#
#---------------------------------------------------------------------------------------------------
# Este programa executa a re-instalação antes de executar o comando
#---------------------------------------------------------------------------------------------------

# inclui a biblioteca com as ferramentas de teste
. ./tests/test-lib.sh

# nome do teste
echo "Teste de criação e compilação de livros";

# rotina de execução
{

    ./make.sh -p test-book --type="book";
    ./make.sh -c tests/temp/test-book;

} > tests/temp/output.txt 2> tests/temp/output.txt

# rotina de asserção
assert_file_not_exists 'tests/temp/test-book/project.pdf';


# if [ -f 'tests/temp/test-book/project.pdf' ]; then
#     exit 1;
# fi
#

exit 0;
