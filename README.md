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

```
$ bundle install
```

7. db を作成する

```
$ rails db:create
```

8. rails server の起動

```
$ rails server -b 0.0.0.0
```

- カタログ設計、テーブル定義書の URL
  [カタログ設計、テーブル定義書](https://docs.google.com/spreadsheets/d/12Lw16JhcY7DwdeNVp7J68OEt14decfDoZw2hDI-oTEo/edit?usp=sharing)

- ワイヤーフレームの URL
  [ワイヤーフレーム](https://drive.google.com/file/d/1ZFj1g5KjL58iOdleaSZqAbxB5T0XJ4aT/view?usp=sharing)

- ER 図のスクリーンショット
  ![Entity Relationship Diagram](https://user-images.githubusercontent.com/92371564/151182644-4767d07d-5b66-48ea-9a3d-324baf8bfc32.png)

- 画面遷移図のスクリーンショット
  ![screen_transition_diagram](https://user-images.githubusercontent.com/92371564/151182896-39280e34-a894-4443-b474-7676c9676016.png)

- 作成した各ファイルは以下の URL に格納されています。
  [DIC*卒業課題*設計資料](https://drive.google.com/drive/folders/1k4fdALXObLL_1xP7nWCBqqavKQHhvWXM?usp=sharing)
