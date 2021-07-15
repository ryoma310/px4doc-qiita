# はじめに
- PX4というドローンのフライトコントローラについて、かなりしっかりとしたドキュメントがあるのでどれを読んでいきたいと思います.
- 順次別の記事にまとめていこうと思います
- 間違い等あれば指摘していただければと思います.

# そもそもPX4とは
<div align="center">
<img src="https://docs.px4.io/master/assets/img/logo_pro_small.e0fa34bd.png" alt="px4_logo" width="100">
</div>

> https://docs.px4.io/master/assets/img/logo_pro_small.e0fa34bd.png

- PX4はドローンなどのいわゆるUV(無人機)向けのオープンソースのコントローラです.
    - 公式サイト: https://px4.io/
- 主にセンサ値を受け取り、モーター等への制御信号を生成するAutopilitにおける頭脳的な役割をはたすハードウェアの開発が行われています.
- 研究・開発用として、ハードウェアをソフトウェア的に再現したもの(これを`SITL(software-in-the-loop)`といいます、反対に実際のハードウェアを用いて行うことを`HITL(hardware-in-the-loop)`といいます)も提供しています
    - github: https://github.com/PX4/PX4-Autopilot
    - シミュレータ等も含まれています.
- PX4のプロジェクトはDronecodeというLinux Foundationが運営するオープンソースのドローン統合開発向けのプラットフォームとそのプロジェクトの一部となっています.
    - リンク: https://www.dronecode.org/

<div align="center">
<img src="https://www.dronecode.org/wp-content/uploads/sites/24/2020/08/dronecode_logo_default-2.png" alt="dronecode_logo" width="100">
</div>

<div align="center">
<img src="https://www.dronecode.org/wp-content/uploads/sites/24/2018/02/Dronecode-software-stack.png" alt="dronecode_projects" height="200">
</div>

> https://www.dronecode.org/wp-content/uploads/sites/24/2020/08/dronecode_logo_default-2.png
> https://www.dronecode.org/wp-content/uploads/sites/24/2018/02/Dronecode-software-stack.png

- 例えば、QGroundControlはいわゆる管制塔の役割をするソフトウェアで、MAVLINKというプロトコルを用いてPX4は外部と通信を行なっています.
- かなり動きの激しいプロジェクトで、細かく理解するには少し時間がかかりそうです..

# 今回読んでいくドキュメント
- リンク: https://docs.px4.io/master/en/
- ドローンについてや、PX4内部でどの様な処理がなされているか、また、シミュレーションのやり方等が書いてあると思っています.

# 目次とリンク(随時更新)


# 終わりに
- 意見・誤植等あった場合は教えていただければと思います.


