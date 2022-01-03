## 社内勉強会/質問推進アプリ（現在実装中）:

- 学習動画を投稿 / 視聴したユーザーとの個別メッセージでの質問・回答
- 配布された会社コード / 会社名を用いて、メールアドレス / パスワードを作成しサインアップすれば誰でも学習動画を投稿できる
- 社外への公開機能（ログインしていないユーザー・ログインしている社外のユーザーも視聴可能に。ログインしている場合はメッセージのやりとりができる）

#### Technology:

- Flutter
- Firebase Auth
- Cloud Firestore
- Freezed
- Hooks Riverpod
- shared Preferences

#### 実装練習内容

Policy

- Riverpod × Freezed × StateNotifier による business logic と UI の分離と、immutable な instance 生成による堅牢かつ最低限の再描画

Auth

- user の signup/login
- login 状態に応じた UI

Theme

- dark mode（端末保存）

DB

- NoSQL（Cloud Firestore）

model

- 基本的な CRUD
- 検索と候補の表示
- いいね（item 毎に全ユーザーからのいいね数の表示）
- item の title, subtitle の読み上げ
- リアルタイム表示の chat

他

- Google Map API
- 音声の文字化

##### 未完了

- ReorderableListView
- 位置情報の取得
- 検索でヒットした文字のハイライト

##### Tips

・when you want to make freezed file,

```
$ flutter pub run build_runner build --delete-conflicting-outputs
```
