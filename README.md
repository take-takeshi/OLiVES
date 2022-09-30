# About
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
基本は書籍と同じコードですが、主に以下の変更を加えています。
* 使用するライブラリを変更（Webpacker → importmap-rails、Sprocket-rails → Propshaft）
* config/route.rb のルーティングを一部変更
* app/views/devise以下3つのビューファイルに data: { turbo: "false" } を追加
* app/controllers/admin以下コントローラにおいて、createメソッドの引数に1階層上のidを追加（例：Dayのインスタンス作成時にconferenceのIDを追加）
* app/controllers/admin/slots_controller.rb内の f.hidden_field → hidden_field_tag に変更

# Note
起動時に以下のエラーが発生するため、起動時はPostgresqlの再起動を行ってください。

* エラー
ActiveRecord :: ConnectionNotEstablished
could not connect to server: No such file or directory
Is the server running locally and accepting
connections on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?

* コマンド
sudo service postgresql restart

