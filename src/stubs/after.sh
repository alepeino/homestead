#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# https://github.com/spatie/homestead-custom/blob/master/after.sh
if [ ! -f /usr/local/extra_homestead_software_installed ]; then
	echo 'installing some extra software'

	apt-get install zsh -y
	git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
	cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
	chsh -s /usr/bin/zsh vagrant
	echo 'export PATH=vendor/bin:$PATH'  >> /home/vagrant/.zshrc
	echo "alias art='php artisan'" >> /home/vagrant/.zshrc
	echo "alias phpspec='vendor/bin/phpspec'" >> /home/vagrant/.zshrc
	echo "alias phpunit='vendor/bin/phpunit'" >> /home/vagrant/.zshrc

    echo set completion-ignore-case on | tee -a /etc/inputrc
	
	git config --global core.excludesfile ~/.gitignore_global
	echo ".DS_Store" > ~/.gitignore_global
	
	touch /home/vagrant/.vimrc
	echo "filetype plugin indent on" >> /home/vagrant/.vimrc
	echo "set hlsearch" >> /home/vagrant/.vimrc
	echo "syntax on" >> /home/vagrant/.vimrc
	echo "set tabstop=4" >> /home/vagrant/.vimrc
	echo "set softtabstop=4" >> /home/vagrant/.vimrc
	echo "set shiftwidth=4" >> /home/vagrant/.vimrc

	touch /usr/local/extra_homestead_software_installed
else    
    echo "extra software already installed... moving on..."
fi
