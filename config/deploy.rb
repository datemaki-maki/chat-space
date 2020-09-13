# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.14.1'

# Capistranoのログの表示に利用する
set :application, 'chat-space'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:datemaki-maki/chat-space.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5' #カリキュラム通りに進めた場合、2.6.5です

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['eb2cc7af7f9497dcf9b131dd579cdfbd54cccb9812b36e3e699d82f5d9752499dedb78e9b411eb39f1bed100a88f3751e2bfe2a5358a2e22e8a3c6b1561fae7c/.ssh/key_pem.pem'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end