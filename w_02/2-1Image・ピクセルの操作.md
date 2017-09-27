# 後期映像表現演習2-1

## Image・ピクセルの操作

画像を読み込んで表示させます。PImageというクラスを使ってラスターデータを操作していきます。
まずはskcketchフォルダと同じ階層にフォルダを新しく作り、'data'と名前をつけます。

メニューの```スケッチ```>>```スケッチフォルダーを開く```
で現在のスケッチのフォルダーを開けます。新しくフォルダをつけて```data```という名前をつけます。
```data```フォルダに使う画像ファイを置いておきます。

![scketch_in_finder.png](図版/scketch_in_finder.png)

Processingのスケッチはこの名前のフォルダを基本にして、ローカルのファイルの読み込みなどを行います。
画像のロードには```loadImage()```関数を使います。```setup()```内で行い起動時に用意します。

引数に

```
PImage photo;

void setup() {
  size(100, 100);
  photo = loadImage("myImage.jpg");
}
```

今度は```draw()```関数内で描画していきます。第1引数にPImageオブジェクト、第2、第３引数に画像のポジションをしてします。


```
void draw() {
  image(photo, 10, 20 );
}
```

## ピクセル情報の取得

```PImage```の```get()```関数で、画像データのピクセル情報を取得できます。座標を指定すると、RGカラー情報が帰ってきます。

![result_pick_color.png](図版/result_pick_color.png)

マウスの座標でカラー情報を取得してみましょう。

```
void draw() {
  image(photo, 10, 20);
  
  color target_color;
  target_color = photo.get(mouseX,mouseY);

  fill(target_color);
  rect(mouseX, mouseY, 20, 20);
}
```

カラー情報からモザイクにしてみましょう。ピクセルを取得する座標を間引いてから、矩形の色に指定してタイル状に並べてみましょう。

### 二次元配列

今までは一次元の配列だけ扱っていましたが、ピクセルのように二次元に渡る配列を扱いたい場合、
```[]```各カッコをつなげて ```[][]``` のように配列の配列を表現できます。

ピクセル情報を扱う時によく出てきますので上手に使えると捗るでしょう。

```color```オブジェクトを格納する二次元配列を作ってみます。
```new```の後の初期化で各カッコの中に配列の長さを指定できます。

```
color[][] target_colors = new color[40][40]; // 40 x 40のカラーを格納するための二次元配列
```


```for```ループでピクセル情報を格納します。```target_colors[j][i] = photo.get(i * 3 + j, i);```のインデックスに注目してみましょう。


![result_mosaic.png](図版/result_mosaic.png)

```
PImage photo;

color[][] target_colors = new color[40][40];

void setup() {
  size(640, 480);
  photo = loadImage("tape.jpg");
  
  int scale_x = photo.width / 40;
  int scale_y = photo.height / 40;
  
  for (int i = 0; i< 40; i++) {
    for (int j = 0; j< 40; j++) {
      target_colors[j][i] = photo.get(j * scale_x, i * scale_y);
    }
  }
}

void draw() {
   fill(255);
   rect(0,0, width, height);
  
   for (int i = 0; i < 40; i++) {
     for (int j = 0; j< 40; j++) {
       fill(target_colors[j][i]);
       noStroke();
      
       pushMatrix();
       rect(0, 0, 10, 10);
       popMatrix();
      
       translate(10, 0);
       if (j == 39) {
         translate(-400, 0);
       }
     }
     translate(0, 10);
   }
   image(photo, 10, 400 );  
}
```
