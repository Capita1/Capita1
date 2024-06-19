#!/bin/bash
#escolha="USER INPUT"
read -p $'1 = Arrumar monitor\n2 = dwm tutorial\n3 = apps\n4 = comandos do terminal\nEscolha:' escolha
echo '====================='
if [ $escolha -eq 1 ]
then
	xrandr --output HDMI-1 --mode 1440x900 --left-of eDP-1
	echo "A resolução do segundo monitor agora é 1440x900"
fi
if [ $escolha -eq 2 ]
then
	echo $'[Shift]+[Alt]+[Enter] Inicia o terminal\n[Alt]+[p] dmenu para programas rodando como o x-www-browser\n[Alt]+[Enter] Alterna janela entre mestre e stack.\n[Alt]+[j] ou [Alt]+[k].Para mover para outro terminal\n[Shift]+[Alt]+[numero da tag] Para mover um terminal para outra tag\n[Alt]+[numero da tag] Para focar em outra tag\n[Alt]+[d](Diminui) ou [Alt]+[i](Aumenta)Para mudar a quantidade de janelas na area mestre\n[Shift]+[Alt]+[c]Para MATAR uma janela\n[Alt]+[t]modo ladrilhos\n[Shift]+[Alt]+[q]Para sair do dwm\n[Alt]+[right mouse button] Para redimensionar a janela flutuante\n[Alt]+[left mouse button] Para mover a janela.\n[Alt]+[Shift]+[space]Alterna o modo janela flutuante na janela ativa\n[Alt]+[f] modo flutuante ><>\n[Alt]+[m] monoculo [M]\n[Alt]+[middle mouse button] Alterna flutuante ou não\n    +------+----------------------------------+--------+\n    | tags | title                            | status |\n    +------+---------------------+------------+--------+\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |          master            |        stack        |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    +----------------------------+---------------------+'
fi
if [ $escolha -eq 3 ]
then
	echo $'Apps:\nneovim\nranger\nhtop\ndwm\nlibrewolf\nnetworkmanager'
fi
if [ $escolha -eq 4 ]
then
	echo $'cd {diretório} muda seu diretório\nmv {localização anterior} {nova localização} move o arquivo (também renomeia)\nrm {arquivo} remove o arquivo\n./{arquivo}.sh executa arquivo bash\nchmod +x {arquivo} aumenta permissão do arquivo\nls mostra os arquivos no diretório atual'
fi
