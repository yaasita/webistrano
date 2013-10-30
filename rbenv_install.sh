#!/bin/bash
set -e
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git
source ~/.bash_profile
rbenv install 1.8.7-p370
rbenv global 1.8.7-p370
rbenv rehash
gem install bundler -v 1.0.10
rbenv rehash
source ~/.bash_profile
echo finish rbenv install!
