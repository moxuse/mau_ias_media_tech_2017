# 後期映像表現演習4-1発表にむけたTips

##フルスクリーン表示

Processing バージョン3以降には全画面表示のための便利機能があります。

スケッチのIDEの画面でメニューから```プレゼンテーション```（キーボードショートカットで ⌘ + shift + R）で起動すると、

全画面表示になります。ただこの方法hの場合プロジェクターや外部ディスプレイなどの第二画面で表示ができません。

### fullScreen()

setup関数で ```size()``` の代わりに ```fullScreen()``` 関数を使うとふ来るクリーン表示になります。

第一引数に外部ディスプレイのID番号を指定すれば第二画面でフルスクリーン表示ができます。


```

void setup() {
  fullScreen(2); // 引数に2を指定して第二画面でフルスクリーン
}

void draw() {
  for(int i = 0; i < 40; i++) {
    ellipse(10 * i + 50, 240, 20, 20);
  }
}

```


## unityの衝突判定

[https://docs.unity3d.com/ja/540/ScriptReference/Collider.OnCollisionEnter.html](https://docs.unity3d.com/ja/540/ScriptReference/Collider.OnCollisionEnter.html)

