#!/bin/bash
# ~/.bashrc
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

read -p $'0 = Sair/fish\n1 = comandos do terminal\n2 = apps\n3 = \n4 = arrumar monitor\nEscolha:' escolha
echo '====================='
if [ $escolha -eq 0 ]
then
	clear
	fish
fi

if [ $escolha -eq 1 ]
then
	echo $'cd {diretório} muda seu diretório\nmv {localização anterior} {nova localização} move o arquivo (também renomeia)\nrm {arquivo} remove o arquivo\n./{arquivo}.sh executa arquivo bash\nchmod +x {arquivo} aumenta permissão do arquivo\nls mostra os arquivos no diretório atual'
fi

if [ $escolha -eq 2 ]
then
	read -p $'Apps:\n1 = Librewolf navegador\n2 = htop gerenciador de processos\n3 = networkmanager gerenciador de rede\n4 = ranger gerenciador de arquivos\n5 = neovim editor de texto\n6 = dwm ambiente area de trabalho\n7 = feh wallpaper engine\nnsxiv visualizador de foto\ngparted gerenciador de disco\n9 = Counter-Strike 1.6\n0 = xcompmgr e transset-df adiciona transparencia no terminal\nEscolha: ' apps
	if [ $apps -eq 0 ]
	then
		xcompmgr -c &
	fi
	if [ $apps -eq 1 ]
	then
		librewolf
	fi
	if [ $apps -eq 2 ]
	then
		htop
	fi
	if [ $apps -eq 3 ]
	then
		nmtui
	fi
	if [ $apps -eq 4 ]
	then
		ranger
	fi
	if [ $apps -eq 5 ]
	then
		nvim .bashrc
	fi
	if [ $apps -eq 6 ]
	then		
		echo $'[Shift]+[Alt]+[Enter] Inicia o terminal\n[Alt]+[p] dmenu para programas rodando como o x-www-browser\n[Alt]+[Enter] Alterna janela entre mestre e stack.\n[Alt]+[j] ou [Alt]+[k].Para mover para outro terminal\n[Shift]+[Alt]+[numero da tag] Para mover um terminal para outra tag\n[Alt]+[numero da tag] Para focar em outra tag\n[Alt]+[d](Diminui) ou [Alt]+[i](Aumenta)Para mudar a quantidade de janelas na area mestre\n[Shift]+[Alt]+[c]Para MATAR uma janela\n[Alt]+[t]modo ladrilhos\n[Shift]+[Alt]+[q]Para sair do dwm\n[Alt]+[botão direito do mouse] Para redimensionar a janela flutuante\n[Alt]+[botão esquerdo do mouse] Para mover a janela.\n[Alt]+[Shift]+[espaço]Alterna o modo janela flutuante na janela ativa\n[Alt]+[f] modo flutuante ><>\n[Alt]+[m] monoculo [M]\n[Alt]+[botão do meio do mouse] Alterna flutuante ou não\n    +------+----------------------------------+--------+\n    | tags | titulo                           | status |\n    +------+---------------------+------------+--------+\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |          mestre            |        stack        |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    +----------------------------+---------------------+'
	fi
	if [ $apps -eq 7 ]

	then
		feh --bg-fill ~/Imagens/wallpapers/vagabond.jpeg
	fi
	if [ $apps -eq 9 ]
	then
		cd Games/Counter-Strike\ WaRzOnE/
		sudo wine CS16Launcher.exe
		xrandr --output HDMI-1 --off
	fi
fi

if [ $escolha -eq 4 ]
then
	xrandr --output HDMI-1 --on
	xrandr --output HDMI-1 --mode 1440x900 --left-of eDP-1
	echo "A resolução do segundo monitor agora é 1440x900"
fi

