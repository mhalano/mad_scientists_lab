#!/bin/bash

# TODO: Melhorar o script de captura para usar o efeito pixelado
# TODO: pensar em usar o xsecurelock quando funcionar corretamente com meu leitor de digital
# Captura a tela. a vantagem de usar o import é que é parte do
# ImageMagick. O i3lock-fancy, que é um script Bash, dá como
# dependência o scrot no script, mas nunca chama o comando.
# import -window root $(mktemp).png)
# scrot /tmp/screen_locked.png

# Pixellate it 10x. Usar esse comando é importante por que
# ele muda o arquivo direto. Se usar o converter precisa do
# arquivo fonte e do arquivo destino.
#mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image. Pode ter outras opções como texto na tela pra ficar
#similar oa i3lock-fancy
#i3lock -i /tmp/screen_locked.png

# o script também não deve funcionar no Sway por que nele é usado a ferramenta
# swaylock.
# TODO: Quando estiver usando Sway adicionar suporte a reconhecer quando está
# rodando no Sway e usar o swaylock.
# o script tem uma limitação que em 95% dos casos não deve ser nada grave:
# ele quando bloqueia a interface gráfica ele não bloqueia junto os consoles
# que por ventura estejam abertos. isso é um problema só se tiver ambiente gráfico e
# console rodando em paralelo. não existe uma boa solução para isso por que não consigo
# enviar comandos para o outro shell. Essa página levanta a questão de como montar
# uma espécie de daemon que fica ouvindo comandos via pipe e executa eles, no caso
# executaria o comando de travamento, mas não funciona por que ele pensa que o comando
# vem do stdin (não deixa de estar certo e não funciona)
# https://www.linuxquestions.org/questions/linux-newbie-8/%5Bbash%5D-send-command-to-another-terminal-831313/

# Uma sessão ssh possui um pseudo-terminal (/dev/pts/*)
# e não possui a variável display setada. por isso ele
# é um terceiro caso.
if [[ -z "$DISPLAY" ]]; then
  if [[ "$(tty)" =~ "/dev/tty" ]]; then
    # lock all consoles and disable the sysrq
    vlock -a -s
  else
    # ssh
    vlock
  fi
else
  # lock the screen
  i3lock-fancy -g &
  # sleep for 2 secs
  sleep 2
  # dim the screen
  xset dpms force off
fi
