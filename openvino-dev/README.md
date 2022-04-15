# PyPi openvino-dev

No openvino-dev pip pckage in ARM envieronment, But in this x86_64 envieronment is abailable download.

ARM環境にはpipのopenvino-devパッケージがありませんが、x86_64環境ではモデルのダウンロードが可能です。

## make dockerfile, and run

```
./run.sh
```

## Download models


```
./download.sh model-name
```


for exsample...

```
./download.sh yolo-v3-tf
```

## Oops..... Error omz_converter on M1 MacBook Docer / x86_64

Docker使えば M1 でもopenvino-devが動く！と思ったのだが、、甘かった。

```
omz_converter --name model-name
    :
    :
The TensorFlow library was compiled to use AVX instructions, but these aren't available on your machine.
qemu: uncaught target signal 6 (Aborted) - core dumped
```
