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

2. bundle install を実行

```
$ bundle install
```

3. DB の作成

```
$ rails db:create
```

4. DB のテストデータを入れる

```
rails db:seed
```

5. localhost で Web サーバーを起動

```
$ rails server -b 0.0.0.0
```

6. localhost からアクセスし、ゲストログインボタンからシステムにアクセスする

- カタログ設計、テーブル定義書の URL
  [カタログ設計、テーブル定義書](https://docs.google.com/spreadsheets/d/12Lw16JhcY7DwdeNVp7J68OEt14decfDoZw2hDI-oTEo/edit?usp=sharing)

- ワイヤーフレームの URL
  [ワイヤーフレーム](https://drive.google.com/file/d/1ZFj1g5KjL58iOdleaSZqAbxB5T0XJ4aT/view?usp=sharing)

- ER 図のスクリーンショット
  ![Entity Relationship Diagram](https://user-images.githubusercontent.com/92371564/154703801-d1220428-0695-45ff-916f-26b04ffaaadb.png)

- 画面遷移図のスクリーンショット
  ![screen_transition_diagram](https://user-images.githubusercontent.com/92371564/155551216-cca00251-1468-4e44-afa5-0edaae8281fb.png)

- 作成した各ファイルは以下の URL に格納されています。
  [DIC*卒業課題*設計資料](https://drive.google.com/drive/folders/1k4fdALXObLL_1xP7nWCBqqavKQHhvWXM?usp=sharing)
