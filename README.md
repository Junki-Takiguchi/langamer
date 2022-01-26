# README

- Ruby version
  3.0.3

- Rails version
  6.0.4.4

- アプリケーションに取り入れる就業 Term で学んだ技術

1. AWS EC2
2. devise
3. メッセージ機能

- カリキュラムで学んでいない技術で、アプリケーションに取り入れようと考えているものを記載すること

1. Docker
2. Gem ransack
3. Gem Rails_admin
4. Gem cancancan
5. Gem language_list
6. Gem country_select
7. Gem game_scraper
8. Gem rails_admin
9. Gem cancancan
10. Gem ransack

- アプリケーションの実行手順（クローンから起動までの手順）

1. git clone の実行

```
$ git clone https://github.com/Junki-Takiguchi/langamer.git
```

2. docker-compose の 24 行目のバインド元の source を上記 1 でクローンしたファイルがあるパスを指定する

3. Docker 用のボリュームを作成する

```
$ docker volume create --name langamer
```

4. docker-compose ファイルのあるパスで docker-compose コマンドで docker コンテナを起動する

```
$ docker-compose run app
```

5. 起動した app コンテナのコンソールにアクセスし、バインドマウントしたソースコードのパスに移動する

6. bundle install を実行

7. db を作成する

```
$ rails db:create
```

8. rails server の起動

```
$ rails server -b 0.0.0.0
```
