# 概要
テックキャンプの最終課題として作成した、フリーマーケットアプリです。<br>
担当箇所は、DB設計、購入機能(バックエンド)、マイページ(フロント、バックエンド両方)、カテゴリー一覧画面(フロント、バックエンド両方)となります。<br>
流れとしては、下記目次をご参照ください。<br>
私が担当した部分のみご確認いただく場合は、下記目次の <b>5.担当箇所一覧</b> よりご確認いただくとスムーズです。<br>

# 目次
1. [アプリケーション情報](#anchor1)
1. [開発状況](#anchor2)
1. [動作確認方法について](#anchor3)
1. [一連の商品出品の流れ](#anchor4)
1. [担当箇所一覧](#anchor5)
1. [一連の商品購入の流れ](#anchor6)
1. [開発を通じて得られた知見](#anchor7)
1. [DB設計](#anchor8)


<a id="anchor1"></a>
# 1.アプリケーション情報

## アプリケーション概要
## 接続先情報

■ App URL
http://54.248.208.64

■IDとPass<br>
ID：80teamf<br>
Pass：80teamf<br>

■ テスト用アカウント <br>
・ 購入者用 <br>
　メールアドレス：buyer1@gmail.com <br>
　パスワード：11111111(1が8個です) <br>

・ 購入用カード情報 <br>
　番号：424242424242 <br>
　期限：20/12 <br>
　セキュリティカード：123 <br>

・ 出品者用 <br>
　メールアドレス：seller1@gmail.com <br>
　パスワード：11111111(1が8個です) <br>

<a id="anchor2"></a>
# 2.開発状況

### 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code <br>
開発期間：8/4〜8/28(24日間) <br>
1日あたりの平均作業時間：10 <br>
人数：5
アジャイル型開発（スクラム） <br>
Trelloによるタスク管理 <br>

<a id="anchor3"></a>
# 3.動作確認方法について
Chromeの最新版を利用してアクセスしてください。 <br>
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。 <br>
接続先およびログイン情報については、上記の通りです。 <br>
同時に複数の方がログインしている場合に、ログインできない可能性がございます。 <br>

<a id="anchor4"></a>
# 4.一連の商品出品の流れ
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品 <br>
お手数ですが、動作確認後、ログアウト処理をお願い致します。

### 出品Gif

#### トップページから出品ボタン押下

https://gyazo.com/de97f9ded9e8bee5c7f9800a16e0b972

#### 商品情報入力

https://gyazo.com/cd1e01250c94e6509f46f655f1334059

#### 商品出品

https://gyazo.com/c6e0b95dfbaf3523f0b2004891da6dea

<a id="anchor5"></a>
# 5.担当箇所一覧
## DB設計
・ 設計及び、ER図の作成

## 商品購入機能(バックエンド)
・ クレジットカードの登録、削除 <br>
・ クレジットカードと結びつく顧客の登録、削除 <br>
・ クレジットカードを使用した購入 <br>

### 詳細とこだわり
gem Payjpを使用し実装。 <br>
「購入」という処理をそれぞれ「カード情報作成」と「支払い」に分けて考えました。 <br>

## マイページ(フロント・バックエンド)
https://gyazo.com/519f688b253dd3271fa54b0fcf8afc26
・ マークアップ全般 <br>
・ サイドバークリックで、画面表示を切り替え <br>

### こだわり
いかに見やすく、わかりやすく、使いやすくするかというUIにこだわりました。 <br>
マウスオーバーした際に、矢印が動くこと、クリックした際に表示されている部分の色が変わることがこだわりです。 <br>
小さなことですが、こうした要素がある場合とそうでない場合は、使用感が圧倒的に違ってくると自負しております。 <br>

## カテゴリー一覧画面(フロント・バックエンド) 

https://gyazo.com/4ac3c23c2b9c47257fee0dd1ff2223bd

・ カテゴリー一覧画面 <br>
・ 各カテゴリーのリンク作成 <br>

### こだわり
元々この部分はカリキュラム内の実装項目として挙げられておりませんでした。 <br>
時間的な制約が厳しい中でしたが、必要だと思い、自ら提案し、半日で実装しました。 <br>
 <br>
以上を担当しました。 <br>

<a id="anchor6"></a>
# 6.一連の商品購入の流れ(バックエンド実装担当)
テストアカウントでログイン→トップページ下部の商品一覧より商品選択→商品詳細→購入確認画面→商品詳細画面

#### 商品選択→商品詳細画面→購入画面へ
https://gyazo.com/516a10b2122b00031695b099fbc4ba5a

#### 購入確認画面→購入後詳細画面へ
https://gyazo.com/3145f42500106955ef2699cdc098bc3b

#### 購入後詳細画面
https://gyazo.com/71dc83279efca7cd114156784c876a20


## カード登録がない場合
#### カード登録画面へ
https://gyazo.com/a0d4c0d0e3dc07dc8f695dc9ca2b9094

#### カード登録完了
https://gyazo.com/7deb85c4b41f6f71bcf930aa59e9540c

#### 登録完了画面
https://gyazo.com/03bdf4e6b578f6ab1895334138cb934e

<a id="anchor7"></a>
# 7.開発を通じて得られた知見

## 工夫した点

### ①チームとして工夫を行った点
　作業中は全員でLINE通話を繋ぎ、何か困ったことがあった時に、すぐ助け合える環境作りを行っておりました。常に通話を続けることで、自分一人では対処のできないエラーを複数人で考えることができ、結果的に早期解決へと繋がりました。 <br>
　また、各自で自信のタスクに係る納期設定を行いました。納期設定を行うことで、それぞれが進捗状況を意識するようになりました。併せて、毎日朝礼の際に、一日の自身のタスクを宣言することで、開発速度が上がりました。 <br>
　結果、ほぼ全ての追加実装項目をも達成することができました。この経験から、初期段階での開発計画がいかに重要であるかを学びました。 <br>

### ②個人として工夫を行った点
　元々チーム開発を始める前に作成した目標が、機能実装に向けて必要な処理を想定できるようになるというものでした。 <br>
　payjpという支払い機能を備えたAPIを実装するにあたり、一概に購入するといっても、具体的にどういった処理が必要になるのか、開発当初は想定できませんでした。しかし、自分なりに調べてトライアンドエラーを繰り返すうちに、少しずつ理解できるようになり、想定通りの仕様で実装する事ができました。 <br>

## 苦労した点

### ①チームとして苦労した点
　他者の書いたコードを読み解き、自分の処理へと繋げていく必要があり、他者のコードの読み解くのに苦労しました。 <br>
　また、コンフリクトの解消においても、今まで経験がなかったので困惑しました。自分のコードと残すべきコードを見比べる必要があり、不用意にコードを消してしまうことでエラーが発生し、開発が止まる可能性があるからです。このことを想定すると、コンフリクト解消には細心の注意を払わなばならないと実感しました。 <br>
　また、マイグレーションファイルにカラムを追加する際に、ロールバックをせずに追加してしまうという事件が発生しました。結果、DBを初期化しなければエラーを解決できないという事態に陥ったことがありました。他者に起因したものでしたが、本経験を本番環境でもやらないよう、DB関係の実装については、特に慎重になる必要があることを学びました。 <br>

## ②個人として苦労した点
　購入機能については、カリキュラムでも一切やらなかった分野であったため、具体的にどのような処理が必要であるのかを考えることに苦労しました。まずは、そもそもAPIとはどういったものなのかや、支払い処理はどのようにして進んでいくのかを、payjpの公式リファレンスや様々な情報を探り、「購入する」というプロセスの細分化を行いました。 <br>
　理解に至るまでにも時間が掛かりました。コーディングを行っても上手くトークンが発行されないことや、顧客が作成できない、ユーザー情報を保持したまま画面を進められない等々、多くのエラーに悩まされました。しかし、こうしたエラーが出た際に、Ruby側だけでなく、ターミナルにも出ているエラー文をしっかりと読むこと、binding.pryや、console.log()を使い、どの処理まで正しく実装できているのかや、意図したデータを引っ張ることができているのかを確認するといったデバッグの重要性を学びました。 <br>
　こうした経験を活かして、エラーが出ても焦らず、一つずつ対処を行いつつ、粘り強く立ち向かうことを強みとして、さらなる技術力向上に励みたいと思っています。 <br>

<a id="anchor8"></a>
# 8.DB設計

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|house_number|string|null:false|
|number_sign_etc|string||
|user_id|integer|null: false, foreign_key|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, unique: true|
|payjp_id|string|null: false|
### Association
- belongs_to :user

## favoritiesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false, unique: true, minimum: 7|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_y_m_d|string|null: false|
### Association
- has_many :addresses
- has_many :favorites
- has_many :orders
- has_many :products
- has_many :comments
- has_many :cards

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_explanation|string|null: false|
|category_id|integer|null:false, foreign_key: true|
|brand|string||
|product_status_id|string|null:false|
|shipping_method_id|string|null: false|
|shipping_charge_id|string|null: false|
|prefecture_id|string|null: false|
|days_until_shipping_id|string|null:false|
|price|integer|null: false|
|status|string|null: false|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :card
- has_many :favorities
- has_many :comments
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string||
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
- has_many :products
