#!/bin/bash
# shellcheck disable=SC1090

tput setaf 2; echo "Do you want to install Python Tools"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev
            sudo apt-get install -y libreadline-dev libsqlite3-dev wget curl llvm
            sudo apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev
            sudo apt-get install -y libffi-dev liblzma-dev python-openssl

            git clone https://github.com/pyenv/pyenv.git ~/.pyenv
            git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
            git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update
            git clone https://github.com/pyenv/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash

            export PATH="$HOME/.pyenv/bin:$PATH"
            eval "$(pyenv init -)"

            pyenv install 2.7.17
            sudo apt-get install -y python-pip

            pyenv install 3.8.1
            sudo apt-get install -y python3-pip

            pip3 install virtualenvwrapper
	        pip3 install virtualenv
            pip3 install jedi
            pip3 install pipenv
            pip3 install yamllint
            break;;
        No ) break;;
    esac
done





tput setaf 2; echo "Do you want to install node.js and tools"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            git clone https://github.com/nodenv/nodenv.git ~/.nodenv
            cd ~/.nodenv && src/configure && make -C src && cd - || return
            git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
            git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs

            export PATH="$HOME/.nodenv/bin:$PATH"
            eval "$(nodenv init -)"


            node_versions=(12.10.0 13.5.0)
            for version in "${node_versions[@]}"
            do
                echo "Installing node version" "$version"
                nodenv install "$version"
                nodenv global "$version"

                npm install -g --depth 0 npm
                npm install -g --depth 0 yarn
                npm install -g --depth 0 lerna
                npm install -g --depth 0 eslint
                npm install -g --depth 0 eslint-plugin-react
                npm install -g --depth 0 eslint-plugin-import
                npm install -g --depth 0 npm-check
                npm install -g --depth 0 htmlhint
                npm install -g --depth 0 csslint
                npm install -g --depth 0 stylelint
                npm install -g --depth 0 elm
                npm install -g --depth 0 typescript
                npm install -g --depth 0 tslint
                npm install -g --depth 0 verdaccio
            done
            break;;
        No ) break;;
    esac
done



tput setaf 2; echo "Do you want to install VirtualBox"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
            wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

            sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian disco contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'
            sudo apt-get update -qq
            sudo apt-get install -y virtualbox
            break;;
        No ) break;;
    esac
done




tput setaf 2; echo "Do you want to install nginx"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y nginx
            break;;
        No ) break;;
    esac
done



tput setaf 2; echo "Do you want install Java and tools"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y openjdk-12-jdk
            sudo update-java-alternatives -s java-12-openjdk-amd64

            sudo apt-get install -y maven
            break;;
        No ) break;;
    esac
done



tput setaf 2; echo "Do you want install go-lang??"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y golang
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want install Ruby and rbenv"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            git clone https://github.com/rbenv/rbenv.git ~/.rbenv
            cd ~/.rbenv && src/configure && make -C src && cd - || return
            git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

            export PATH="$HOME/.rbenv/bin:$PATH"
            eval "$(rbenv init -)"

            rbenv install 2.7.0
            rbenv global 2.7.0
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install docker"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable"
            sudo apt-get update -qq
            sudo apt-get install docker-ce docker-ce-cli containerd.io

            sudo groupadd docker
            sudo usermod -aG docker "$USER"
            sudo newgrp docker
            break;;
        No ) break;;
    esac
done

tput setaf 2; echo "Do you want to Android Studio"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y qemu-kvm
            sudo apt-get install -y libvirt-bin
            sudo apt-get install -y ubuntu-vm-builder
            sudo apt-get install -y bridge-utils

            sudo adduser "$USER" kvm

            sudo snap install android-studio --classic
            break;;
        No ) break;;
    esac
done

