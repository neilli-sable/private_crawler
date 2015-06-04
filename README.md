# PrivateCrawler

## Environment
Working on Ubuntu 14.04LTS.

## Install
sudo apt install build-essential libssl-dev git-core -y
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL -l
gem install bundler
bundle install
sudo apt install xvfb firefox -y
