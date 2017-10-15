# 後期映像表現演習3-3

## OSC他のアプリケーションとの連携

OSC (Open Sound Control) と呼ばれるプロトコルを使って同じマシン内の
違ったアプリケーション間で通信してみます。


### IPアドレス

ネットワークにつながれたコンピューターには必ずIPと呼ばれるアドレス番号が割り振られます。
通常IPv4と呼ばれるドットで区切った4つの正数が割り振られます。

### ループバックアドレス

自身のパソコンを表す特別に予約されたIPあります。

```127.0.0.1```

ホスト名で文字列で指定することもあります。これも予約された特別なアドレスです。

```localhost```

### ポート番号

ネットワーク上でアプリケーションを立ち上げるときに、ポート番号で管理します。
同じポートに複数のアプリケーションが立ち上げることができません。OSCの送受信の場合、送信用と受信用でポート番号を別にしておく必要があります。


### メッセージ

OSCはパケット送信の際文字列をスラッシュ(/)で区切った```アドレス```でメッセージの分類を送信側と受信側で事前に決めておきます。
スラッシュで区切ることで、ツリー構造状に階層化することもできます。


### メッセージの送信

まずProcessingからOSCメッセージを送信して、Max/MSPで受けとる方法です。

```oscP5```と```netP5``` ライブラリの二つをインポートします。メニューの```スケッチ```>>```ライブラリのインポート```>>```oscP5```を選択します。
エディタに両方のライブラリのインポートが追加されます。

### OscP5の初期化

OscP5のインスタンス変数を宣言してから```setup()```で初期化します。

```
OscP5 oscP5;

// setup()内
oscP5 = new OscP5(this, 5000);
```

### NetAddress

送信先の煽ケーション（今回はローカルホストのMax/MSP）のらドレスを指定するために```NetAddress```オブジェクトを使います。
これもインスタンス変数を宣言してから```setup()```で初期化します。


```
NetAddress remoteServer;
// setup()内

remoteServer = new NetAddress("127.0.0.1", 5001);
```

OscP5で指定した送受信するポートとは別のポートを指定します。ここを同じにしておくことはできません。
今回は受信を5000番、送信先（Max側）を5001にしておきます。

### oscMessage

ではマウスをプレスしたら```/test```というアドレスに何かメッセージを送信してみます。

送信するには```OscMessage```のインスタンスを毎回作ってパケットを作って```OscP5```の```send()```関数で送信します。
```mousePressed()```関数にマウスを押した時の処理として描いてみます。

```
OscMessage msg = new OscMessage("/freq");
  
int freq = mouseX + 50; 
msg.add(freq);
```

```OscMessage msg```には```add```という関数が用意されていでaddするごとにパケットの後ろへ値を追加していきます。
```mouseX```の値を追加してみましょう。


```
void mousePressed(){
  OscMessage msg = new OscMessage("/freq");
  
  int freq = mouseX + 50; 
  msg.add(freq);
  
  oscP5.send(msg, remoteServer);
}
```

### Maxで受信

Max側では```udpreceive```オブジェクトにポート番号を指定してOSCのパケットを受け取ります。
受け取ったパケットは```unipack```オブジェクトを使って、アドレスと値とに分解します。

```/freq```アドレスで受け取った値を使ってシンセを鳴らしてみます。


![max_osc_receive.png](図版/max_osc_receive.png)


### コード全体

```
import oscP5.*;
import netP5.*;

OscP5 oscP5;

NetAddress remoteServer;

void setup() {
  size(640, 480);

  oscP5 = new OscP5(this, 5000);

  remoteServer = new NetAddress("127.0.0.1", 5001);
}

void draw() {
  background(255); 
}

void mousePressed(){
  OscMessage msg = new OscMessage("/freq");
  
  int freq = mouseX + 50; 
  msg.add(freq);
  
  oscP5.send(msg, remoteServer);
}
```





