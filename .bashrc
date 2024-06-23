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

read -p $'0 = Sair/fish\n1 = comandos do terminal\n2 = apps\n3 = wallpapers\n4 = arrumar monitor\nEscolha:' escolha
echo '====================='
if [ $escolha -eq 0 ]
then
	clear
	fish
fi

if [ $escolha -eq 1 ]
then
	echo $'cd {diretório} muda seu diretório\nmv {localização anterior} {nova localização} move o arquivo (também renomeia)\nrm {arquivo} remove o arquivo\n./{arquivo}.sh executa arquivo bash\nchmod +x {arquivo} aumenta permissão do arquivo\nls mostra os arquivos no diretório atual\nmkdir {diretorio} cria diretorio'
fi

if [ $escolha -eq 2 ]
then
	read -p $'Apps:\n1 = Librewolf navegador\n2 = htop gerenciador de processos\n3 = networkmanager gerenciador de rede\n4 = ranger gerenciador de arquivos\n5 = neovim editor de texto\n6 = \n7 = \n8 = \n9 = wine\n0 = outros\nEscolha: ' apps
	if [ $apps -eq 0 ]
	then
	read -p $'Outros:\n1 = DWM tutorial\n2 = lista de apps\n3 = ativar compositor\nEscolha: ' outros
		if [ $outros -eq 1 ]
		then
			echo $'[Shift]+[Alt]+[Enter] Inicia o terminal\n[Alt]+[p] dmenu para programas rodando como o x-www-browser\n[Alt]+[Enter] Alterna janela entre mestre e stack.\n[Alt]+[j] ou [Alt]+[k].Para mover para outro terminal\n[Shift]+[Alt]+[numero da tag] Para mover um terminal para outra tag\n[Alt]+[numero da tag] Para focar em outra tag\n[Alt]+[d](Diminui) ou [Alt]+[i](Aumenta)Para mudar a quantidade de janelas na area mestre\n[Shift]+[Alt]+[c]Para MATAR uma janela\n[Alt]+[t]modo ladrilhos\n[Shift]+[Alt]+[q]Para sair do dwm\n[Alt]+[botão direito do mouse] Para redimensionar a janela flutuante\n[Alt]+[botão esquerdo do mouse] Para mover a janela.\n[Alt]+[Shift]+[espaço]Alterna o modo janela flutuante na janela ativa\n[Alt]+[f] modo flutuante ><>\n[Alt]+[m] monoculo [M]\n[Alt]+[botão do meio do mouse] Alterna flutuante ou não\n    +------+----------------------------------+--------+\n    | tags | titulo                           | status |\n    +------+---------------------+------------+--------+\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |          mestre            |        stack        |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    |                            |                     |\n    +----------------------------+---------------------+'
			fish
		fi
		if [ $outros -eq 2 ]
		then
			echo $'feh wallpaper e visualizador de fotos\ncompmgr compositor\nremmina e freerdp cliente de area de trabalho remota\ndwm ambiente area de trabalho\nspeedtest-cli teste de net\ngparted gerenciador de discos\n(AUR)manga-cli-git mangas em ingles\ngoanime animes em pt-br/ani-cli animes em ingles'
		fi
		if [ $outros -eq 3 ]
		then
			xcompmgr -c &
			clear 
			fish
		fi
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
		fish
	fi
	if [ $apps -eq 7 ]
	then
		fish
	fi
	if [ $apps -eq 8 ]
	then
		fish
	fi
	if [ $apps -eq 9 ]
	then
		read -p $'Wine:\n1 = Counter-Strike 1.6\n2 = AIMP\nEscolha: ' wine
		if [ $wine -eq 1 ]
		then
			cd Games/Counter-Strike\ WaRzOnE/
			sudo wine CS16Launcher.exe
			xrandr --output HDMI-1 --off
		fi
		if [ $wine -eq 2 ]
		then
			cd Games/AIMP
			wine AIMP.exe
		fi
	fi
fi

if [ $escolha -eq 3 ]
then
	read -p $'Wallpapers:\n1 = MGRR\n2 = VAGABOND\n3 = PSYCHO MOB\n4 = \n5 = \n6 = \n7 = \n8 = \n9 = \n0 = \nEscolha: ' walls
	if [ $walls -eq 1 ]
	then
		feh --bg-fill Imagens/wallpapers/1-MGRR.jpg
	fi
	if [ $walls -eq 2 ]
	then	
		feh --bg-fill Imagens/wallpapers/1-VAGABOND.jpg
	fi
	if [ $walls -eq 3 ]
	then
		feh --bg-fill Imagens/wallpapers/1-MOBPSYCHO.jpg
	fi
	if [ $walls -eq 4 ]
	then
		feh
	fi
	if [ $walls -eq 5 ]
	then
		feh
	fi
	if [ $walls -eq 6 ]
	then
		feh
	fi
fi
if [ $escolha -eq 4 ]
then
	eval `/usr/bin/ssh-agent`

	if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
	then
		SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
	fi
	while true
	do
		TIME=$(date +%T) 
		IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
		TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
		xsetroot -name "$TIME | $IP $TEMP"	
		sleep 1s
	done &
	xrandr --output HDMI-1 --mode 1440x900 --left-of eDP-1
	echo "A resolução do segundo monitor agora é 1440x900"
	fish
fi
