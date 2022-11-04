![demo](https://gyazo.com/aea72ba0fc5d8665bdad29a9905bebf3.png)

# アプリケーション名

[sekara　断捨離](https://sekara-danshari.herokuapp.com/)

# アプリケーション概要

断捨離や整理などで手離したものを記録することができる。<br>
他者の記録を見ることで自身の断捨離や整理の参考にすることができる。

# URL

https://sekara-danshari.herokuapp.com/

# テスト用アカウント

* Basic認証
  * ユーザー名：admin
  * パスワード：2222
* テストアカウント
  * メールアドレス：aaa@aaa.com
  * パスワード：aaa111


# 利用方法

* トップページのヘッダーからユーザー新規登録を行う。
* 「記録する」ボタンから手離したものの内容（名前・カテゴリー・手離し方・手離した理由・手離した結果（編集で後日選択可）・コメント（任意）を登録する。
* トップページの「みんなの断捨離」やヘッダー検索フォームを利用した検索の結果から、投稿された記録の詳細を確認する。



# アプリケーションを作成した背景

昨今、断捨離や生前整理が流行っているが、現在の持ち物を記録しておくアプリケーションはあっても、手離したものを記録するアプリケーションはない。<br>
いざ始めてみてもモチベーションが維持できなかったり、手離し方がわからなかったりするために途中で断念してしまうことが多いように推察する。<br>
断捨離や整理が終われば不要になる記録でも、途中経過を記録することでモチベーションの維持を期待する。<br>
また、他の人が「何を」、「どういった理由で」、「どうのような方法で」手離したのかや、その結果の「良し悪し」を共有することができれば、断捨離や整理に悩む人々の助けになるのではなかと思量する。<br>
どんな世代の方でも使いやすいよう、機能も見た目もなるべくシンプルになるように作成した。

# データベース設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| profile            | text   |                           |

### Association

* has_many :items

## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| category_id      | integer | null: false |
| let_go_way_id    | integer | null: false |
| let_go_reason_id | integer | null: false |
| result_id        | integer |             |
| comment          | text    |             |

### Associations

* belongs_to :user

# ER図

![er](https://user-images.githubusercontent.com/102402722/198885026-755962fc-1e66-419b-8aa6-06cdf8bd8ddc.png)

# 開発環境

* PC
  * os：Monterey
  * バージョン：12.2.1
* フロントエンド
  * HTML/CSS
  * Bootstrap
  * Javascript
* バックエンド
  * Ruby 2.6.5
  * rails 6.0.6
* データベース
  * MySQL
* インフラ
  * heroku
  * AWS S3
  * Git Github
