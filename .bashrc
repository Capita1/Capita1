#!/bin/bash
# ~/.bashrc

term="$(cat /proc/$PPID/comm)"
if [[ $term = "xcompmgr" ]]; then
    echo 'rodando'
else
xcompmgr -c &
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

term="$(cat /proc/$PPID/comm)"
if [[ $term = "st" ]]; then
    transset-df "0.8" --id "$WINDOWID"  ⋗/dev/null
fi

#ajuda

read -p $'0 = Sair\n1 = Arrumar monitor\n2 = dwm tutorial\n3 = apps\n4 = comandos do terminal\n5 = CS 1.6\nEscolha:' escolha
echo '====================='
if [ $escolha -eq 0 ]
then
	clear
fi
if [ $escolha -eq 1 ]
then
	xrandr --output HDMI-1 --on
	xrandr --output HDMI-1 --mode 1440x900 --left-of eDP-1
	echo "A resolução do segundo monitor agora é 1440x900"
fi
if [ $escolha -eq 2 ]
then
	echo $'[Shift]+[Alt]+[Enter] Inicia o terminal\n[Alt]+[p] dmenu para programas rodando como o x-www-browser\n[Alt]+[Enter] Alterna janela entre mestre e stack.\n[Alt]+[j] ou [Alt]+[k].Para mover para outro terminal\n[Shift]+[Alt]+[numero da tag] Para mover um terminal para outra tag\n[Alt]+[numero da tag] Para focar em outra tag\n[Alt]+[d](Diminui) ou [Alt]+[i](Aumenta)Para mudar a quantidade de janelas na area mestre\n[Shift]+[Alt]+[c]Para MATAR uma janela\n[Alt]+[t]modo ladrilhos\n[Shift]+[Alt]+[q]Para sair do dwm\n[Alt]+[botão direito do mouse] Para redimensionar a janela flutuante\n[Alt]+[botão esquerdo do mouse] Para mover a janela.\n[Alt]+[Shift]+[espaço]Alterna o modo janela flutuante na janela ativa\n[Alt]+[f] modo flutuante ><>\n[Alt]+[m] monoculo [M]\n[Alt]+[botão do meio do mouse] Alterna flutuante ou não\n    +------+----------------------------------+--------+\n    | tags | titulo                           | status |\n    +------+---------------------+------------+--------+\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |          mestre            |        stack        |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    +----------------------------+---------------------+'
fi
if [ $escolha -eq 3 ]
then
	echo $'Apps:\ntransset-df e xcompmgr adiciona transparencia no terminal\nneovim editor de texto\nranger gerenciador de arquivos\nhtop gerenciador de processos\ndwm ambiente area de trabalho\nlibrewolf navegador\nnetworkmanager gerenciador de rede\nfeh wallpaper engine\nnsxiv visualizador de foto'
fi
if [ $escolha -eq 4 ]
then
	echo $'cd {diretório} muda seu diretório\nmv {localização anterior} {nova localização} move o arquivo (também renomeia)\nrm {arquivo} remove o arquivo\n./{arquivo}.sh executa arquivo bash\nchmod +x {arquivo} aumenta permissão do arquivo\nls mostra os arquivos no diretório atual'
fi
if [ $escolha -eq 5 ]
then
	cd Games/Counter-Strike\ WaRzOnE/
	sudo wine CS16Launcher.exe
	xrandr --output HDMI-1 --off
fi

