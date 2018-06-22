# rbenv install with nonroot account
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo '# rbenv config' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# ruby-build setup
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# install ruby, set it global
sudo -H -u vagrant bash -i -c 'rbenv install 2.2.10'
sudo -H -u vagrant bash -i -c 'rbenv global 2.2.10'
sudo -H -u vagrant bash -i -c 'rbenv rehash'
# don't install documentation
echo 'gem: --no-document' >> ~/.gemrc

# install bundler
sudo -H -u vagrant bash -i -c 'gem install bundler'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

# install rails
sudo -H -u vagrant bash -i -c 'gem install rails -v 4.2.5'
sudo -H -u vagrant bash -i -c 'rbenv rehash'