# Name（リポジトリ/プロジェクト/OSSなどの名前）
OLiVESは、Ruby on Railsを使用して作られたオンラインイベント支援システムです。

『最短距離でしっかり身に付く! Webアプリケーション開発の教科書~Ruby on Railsで作る本格Webアプリ』
の第5～6章を写しつつ、細部を変更したプログラムになっております。

また掲載にあたっては、著者である飯尾淳様に許可をいただいています。
 
 
# Version
* Ruby 3.1.0
* Rails 7.0.2.3
* psql (PostgreSQL) 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
* heroku 7.59.4 linux-x64 node-v12.21.0

# Changes
・使用するライブラリを変更（Webpacker→importmap-rails、Sprocket-rails→Propshaft）
 
# Note
起動時に以下のエラーが発生するため、起動時はPostgresqlの再起動を行ってください。

・エラー
ActiveRecord :: ConnectionNotEstablished
could not connect to server: No such file or directory
Is the server running locally and accepting
connections on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?

・コマンド
sudo service postgresql restart

