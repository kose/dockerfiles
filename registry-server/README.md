# private registry server

自前でレジストリサーバを持つことにする。


1. MacのDocker Desktopで開発
2. Ubuntu上運用

Macでimageをbuild、debugして、それをそのまま運用する。

## No TLS

ローカルでしかアクセスしないので、
Mac (client)側で、http 通信する指定をする。


```
$HOME/.docker/daemon.json

{
  "insecure-registries": ["ubuntu.local:5100"]
}
```

Ubuntuでもlocalhostでない場合は設定必要

```
/etc/docker/daemon.json

{
  "insecure-registries" : ["nuc.local:5100"]
}
```
