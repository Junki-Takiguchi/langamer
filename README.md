# README

- Ruby version
  3.0.3

- Rails version
  6.0.4.4

- アプリケーションに取り入れる就業 Term で学んだ技術

1. AWS EC2
2. devise
3. メッセージ機能
4. ページネーション（kaminari）
5. 画像投稿機能 (carrierwave)

- カリキュラムで学んでいない技術で、アプリケーションに取り入れようと考えているものを記載すること

1. Docker
2. Gem ransack
3. Gem rails_admin
4. Gem cancancan
5. Gem language_list
6. Gem country_select

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

4. docker-compose ファイルに記載したパス上で docker-compose コマンドを使い docker コンテナを起動する

```
$ docker-compose run app
```

5. 起動した app コンテナのコンソールにアクセスし、バインドマウントしたソースコードのパスに移動する

```
docker exec -it langamer_app /bin/bash
```

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

- Note
  Webpacker::Manifest::MissingEntryError in...
  というエラーで web ページがうまく立ち上がらないときの対処法

```
$ rails webpacker:install
$ rails webpacker:compile
```

https://qiita.com/shizen-shin/items/38fd774ffc87bc8838c9
https://prograshi.com/framework/rails/git-clone-webpacker-not-found/

- jquery のインストールで失敗している場合は別途コンソールから yarn コマンドでインストールします

```
yarn add jquery
```

- Dockerfile, docker-compose の更新を行った場合は以下を実行する必要がある

```
$ apt install imagemagick
$ bundle install

# 開発環境の場合
$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
$ sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
$ apt update
$ apt -y install google-chrome-stable
$ google-chrome --version

$ curl -O https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip
$ apt install -y unzip
$ unzip chromedriver_linux64.zip
$ mv chromedriver /usr/local/bin/
$ rm chromedriver_linux64.zip
$ chromedriver --version
```

サインイン URL
http://localhost:3000/users/sign_in

登録確認メール
http://localhost:3000/letter_opener

- カタログ設計、テーブル定義書の URL
  [カタログ設計、テーブル定義書](https://docs.google.com/spreadsheets/d/12Lw16JhcY7DwdeNVp7J68OEt14decfDoZw2hDI-oTEo/edit?usp=sharing)

- ワイヤーフレームの URL
  [ワイヤーフレーム](https://drive.google.com/file/d/1ZFj1g5KjL58iOdleaSZqAbxB5T0XJ4aT/view?usp=sharing)

- ER 図のスクリーンショット
  ![Entity Relationship Diagram](https://user-images.githubusercontent.com/92371564/154703801-d1220428-0695-45ff-916f-26b04ffaaadb.png)

- 画面遷移図のスクリーンショット
  ![screen_transition_diagram](https://user-images.githubusercontent.com/92371564/151182896-39280e34-a894-4443-b474-7676c9676016.png)

- 作成した各ファイルは以下の URL に格納されています。
  [DIC*卒業課題*設計資料](https://drive.google.com/drive/folders/1k4fdALXObLL_1xP7nWCBqqavKQHhvWXM?usp=sharing)
