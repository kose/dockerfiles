# PyPi openvino-dev

ARM環境にはpipのopenvino-devパッケージが作られていないので、x86_64環境でOpenVINOモデルのダウンロードを行います。

## make dockerfile

```
./run.sh
```

## モデルダウンロード


```
./download.sh model-name
```


例えば

```
./download.sh yolo-v3-tf
```
