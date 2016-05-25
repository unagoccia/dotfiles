# dotfiles
dotfiles関連を管理する (.zshrc brewfile etc.)

## 1. atom
■パッケージリストの作り方  
　$ apm list --installed --bare > packages.txt  
■パッケージのインストール (from list)  
　$ apm install --packages-file packages.txt

## 2. svn
日本語ファイルを扱うsvnはMacPortでインストールできる  
■参考ページ  
　http://dackdive.hateblo.jp/entry/2016/02/10/191036  
■MacPort  
　https://www.macports.org/install.php  
■MacPortのPorxy設定  
　http://ishwt.net/blog/2011/04/05/use-macports-at-inside-of-proxy/  
>
>1. ~/.profileに以下の行を追加。  
>`export http_proxy=http://<proxy_server>:<proxy_port>`
>2. /opt/local/etc/macports/sources.conf の rsync:// の行をコメントアウトして、ファイルを追加。  
>`#rsync://rsync.macports.org/release/ports/ [default]`  
>`http://www.macports.org/files/ports.tar.gz [default]`  
>3. portindex を最新化してから利用。  
>`$ sudo port -d sync`  
>4. 動作確認  
>`$ sudo port list`  
>5. うまくいかない場合は  
>`$ sudo env http_proxy="http://<proxy_server>:<proxy_port>" port ...`  

■svnインストール  
>1. インストール  
>`$ sudo port -v install subversion +unicode_path`  
>2. インストール確認  
>`$ which svn`  
>`/opt/local/bin/svn`  
