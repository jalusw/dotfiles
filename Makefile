bootstrap:
	sudo ./bootstrap.sh

play:
	sudo ansible-playbook ./ansible/playbook.yml

unlink:
	stow -D .

link:
	stow .
