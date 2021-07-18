# はじめに
- PX4というドローンのフライトコントローラについて、かなりしっかりとしたドキュメントがあるのでどれを読んでいきたいと思います.
    - 参考: [PX4のドキュメント・通覧](https://qiita.com/asu_mio_310/items/3368cae05e07d775e9c4)
- 間違い等あれば指摘していただければと思います.
- この記事ではイントロを読んでいきます.

# Introduction
- 対応箇所: https://docs.px4.io/master/en/index.html

- PX４は`Professional Autopilot`であり、産業・学術からの世界規模の開発者が開発を行っている
- 世界中のコミュニティをサポートしており、多くの乗り物に対応している
    - 競技用ドローン
    - 運搬用ドローン
    - 地上のドローン
    - 潜水艦ドローン

---
## この後の構成
- この後のコンテンツに関しては、ユーザが何をしたいのかによって読むべき部分が変わってくる

- [Getting Starrted](https://docs.px4.io/master/en/getting_started/)はみんなが読むべきで以下の内容が含まれる
    - PX4の外観
    - flight stackによって提供される内容について
        - 飛行モードについて
        - 安全性について
    - 対応するハードウェアについて
        - フライトコントローラ
        - 乗り物
        - (枠としての)機体
        - テレメトリシステム
        - RCコントロールシステム

- やりたいことによってその後の章は読むべきかは変わってくる
### ドローンをすでに持っていて、飛ばしたいぜって人
- PX4に対応した`Ready To Fly(RTF) vehicle`を持っているなら..
    - [Basic Configuration](https://docs.px4.io/master/en/config/)
        - どうやってファームウェアを最新版にするか?
        - 主なセンサをどのようにキャリブレーションするか?
        - 遠隔操作と安全システムをそのように設定するか?
    - [Flying](https://docs.px4.io/master/en/flying/)
        - 飛行に関する基本的なことが書いてある
        - どこでどのように安全に飛行させるか
        - 機器や飛行に関する問題をどうデバッグするか
        - 飛行モードに関する内容も書いてある.
- ちなみに...
    - 対応する乗り物は[Airframes Reference](https://docs.px4.io/master/en/airframes/airframe_reference.html)に記載されている
    - 記載してある乗り物はQGroundControlを使用してダウンロードできる、テストや調整済みの設定を持つ乗り物たち

### 1からドローンを組み立ててPX4で飛ばしたいぜって人
- 乗り物を1から作るには...
    - フレームを選ぶ
        - [Airframe Builds](https://docs.px4.io/master/en/airframes/)に対応するフレームとどうやって作ればいいかが載ってる
    - フライトコントローラを選ぶ
        - [Getting Starrted > Filght Controllers](https://docs.px4.io/master/en/getting_started/flight_controller_selection.html) と [Autopilot Hardware](https://docs.px4.io/master/en/flight_controller/)をみて
    - [Assenbry](https://docs.px4.io/master/en/assembly/)
        - Autopilotに重要な周辺機器の接続方法が書いてある
    - [Basic Configuration](https://docs.px4.io/master/en/config/)
        - ファームウェアのアップデートとフレームに合わせた設定方法
        - 主なセンサをどのようにキャリブレーションするか?
        - 遠隔操作と安全システムをそのように設定するか?
    - 飛ばす準備ができたら、[Flying](https://docs.px4.io/master/en/flying/)をみよう


### 積荷やカメラを載せたいんだって人
- [payloads](https://docs.px4.io/master/en/payloads/)
    - どのようにペイロードを統合するかが書いてある
    - どのようにカメラを追加するか?
    - 荷物を運ぶためにはPX4をどのように設定すればいいか?

### 対応する乗り物を改造したいって人
- フライトコントローラと基本的なセンサについては上に記載してある通り
- 新しいセンサを積んだり、飛行特性に大きく影響する変更をする場合は...
    - [Peripheral Hardware](https://docs.px4.io/master/en/peripherals/)
        - 外部センサーの使用に関する追加情報を提供
    - [Basic Configuration](https://docs.px4.io/master/en/config/)
        - 主要なセンサーのキャリブレーション方法を説明
    - [Advanced Configuration](https://docs.px4.io/master/en/advanced_config/)
        - 機体の再調整/微調整について書いてある

### 新しいハードウェア上でPX4を動かして、プラットフォームを拡張したいんだって人
- [Development](https://docs.px4.io/master/en/development/development.html)
    - どうやって新しい機体や新しい種類の乗り物を対応させるか?
    - どうやって飛行アルゴリズムを変更するか?
    - どうやって新しい飛行モードを追加するか?
    - どうやって新しいハードウェアを追加するか?
    - どうやってフライトコントローラ外とPX4が通信をするか?
    - どうやってPX4に貢献するか?


# 終わりに
- イントロということもあって、ドキュメントの読み方みたいな内容が中心でした
- 意見・誤植等あった場合は教えていただければと思います.
