# 設定コマンド  
1. zshに切り替え  
  ```sh
  zsh
  ```

1. リポジトリをclone  
  ```sh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"  
  ```
  
1. 設定ファイルを作成  
  ```sh
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  ```

1. .zpreztoの絶対パス取得  
  ```sh
  cd ${.zpreztoが保存されているディレクトリ}
  
  path_zprezto=$(cd $(basename .zprezto);pwd)  
  rm -rf $HOME/.zprezto  
  ln -snf $path_zprezto $HOME/.zprezto  
  ```
  
1. Shellのデフォルトに設定  
  ```sh
  chsh -s /bin/zsh  
  ```
