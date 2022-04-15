# PyPi openvino-dev

ARM環境ではpipのopenvino-devパッケージが作られていなので、x86_64環境でOpenVINOのモデルダウンロードを行います。

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
