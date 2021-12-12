# flutter_ui

## Technology:

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

- NoSQL

model

- 基本的な CRUD
- 検索と候補の表示
- いいね（item 毎に全ユーザーからのいいね数の表示）
- item の title, subtitle の読み上げ

API

- Google Map

他

- 音声の文字化

##### 未完了

- ReorderableListView
- いいね数に基づいて item の並び替え
- 位置情報の取得

##### Tips

・when you want to make freezed file,

```
$ flutter pub run build_runner build --delete-conflicting-outputs
```
