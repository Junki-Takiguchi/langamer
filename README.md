# README

【アプリケーション名】
Langamer

公開 URL
https://www.language-gamer.com/ja/

## Langamer とは

ゲームを通して言語交流の友達を見つけるサービスです。

## どのような問題を解決するか

このサービスを通じてオンラインゲームをしながら言語交換出来る友人を見つけることで、<br>
ゲームの世界を共有し、常に変化する環境で会話をする機会を提供します。<br>
それにより、一般的な英会話における話題性の乏しさの解消と、<br>
ゲーム内の共通用語を用いることで、語学初学者でも言いたいことを伝えやすく、理解しやすいコミュニケーション環境を提供します。

## 主な使用技術

Ruby 3.0.3<br>
Ruby on Rails 6.0.4.4<br>
AWS EC2/S3/VPC/Route53/ALB/ACM<br>
Docker/docker-compose<br>
jquery 3.6.0<br>
Bootstrap 5.0.2<br>
GoogleFonts<br>
Google Analytics<br>

## 主な使用 Gem

devise<br>
rails_admin<br>
carrier_wave<br>
kaminari<br>
ransack<br>
fog-aws<br>
unicorn<br>
language_list<br>
country_select<br>

## 主な機能

- ユーザー機能<br>
  ユーザー作成 編集 削除<br>
  ユーザーログイン / ログアウト<br>
  ゲストユーザーログイン機能<br>

- ユーザー情報の公開設定機能<br>
  公開 / 非公開 / フレンドのみ公開<br>

- 募集投稿機能<br>
  募集投稿 作成 / 編集 / 削除<br>
  投稿検索機能<br>

- フレンド機能<br>
  フレンド申請機能<br>
  フレンド申請承認機能<br>
  フレンド申請却下機能<br>
  フレンド削除機能<br>

- メッセージ機能<br>
  チャットルーム作成機能<br>
  メッセージ作成機能<br>

- その他<br>
  多言語対応（JP/EN）<br>
  固有ドメイン / SSL 化対応<br>

## アプリケーションの実行手順（クローンから起動までの手順）

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

# ドキュメント

- カタログ設計、テーブル定義書の URL
  [カタログ設計、テーブル定義書](https://docs.google.com/spreadsheets/d/12Lw16JhcY7DwdeNVp7J68OEt14decfDoZw2hDI-oTEo/edit?usp=sharing)

- ワイヤーフレーム
  ![wire-frame](https://user-images.githubusercontent.com/92371564/156359501-7570b342-457e-4943-979d-7820b3aaa159.png)

- ER 図
  ![Entity Relationship Diagram](https://user-images.githubusercontent.com/92371564/154703801-d1220428-0695-45ff-916f-26b04ffaaadb.png)

- 画面遷移図
  ![screen_transition_diagram](https://user-images.githubusercontent.com/92371564/155551216-cca00251-1468-4e44-afa5-0edaae8281fb.png)

- 本番実行環境
- ![AWS環境](https://user-images.githubusercontent.com/92371564/156358961-5041c6ee-5b40-463d-8568-ee4b83e1d6e2.PNG)
