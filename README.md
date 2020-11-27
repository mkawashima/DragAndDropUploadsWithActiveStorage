# README

## Docker Rails環境
これは、
Docker Composeを使用してRails6 / PostgreSQL のアプリケーション環境を構築すためのテンプレートリポジトリ
です。

### 前提

* このリポジトリ（docker_rails_env_template）は、テンプレートリポジトリになっている。別リポジトリを作成した上で使用すること。
* DBは、PostgreSQL。
* gemは、(ゲストOSの)globalにインストールされる。
* Rails Application Template を使用し、基本的な初期設定が実行される。


## 事前準備

### リポジトリを作成する
このリポジトリ（docker_rails_env_template）は、テンプレートリポジトリになっているため、
(Use this template) をクリックして、新しいRailsプロジェクトのリポジトリを作成する。

### git clone

新しく作成したRailsプロジェクトのリポジトリ を ローカルの開発環境に、git clone する。


## 環境構築手順

以下、ローカルにて実行。

### rails new

rails new を実行し、インストール。
```
$ docker-compose run web rails new . --force --no-deps --database=postgresql -m application_template/template.rb
```

### docker image ビルド

ここまでのコンテナを永続化。
```
$ docker-compose build
```

### git commit

この段階で、ひと通り最初の環境が構築されたので、commit を行う。


## 環境 起動/停止 など

### 起動

```
$ docker-compose up
```
サーバー Pumaも起動される。

`http://localhost:3000` でアクセス可能。

### 停止
`Ctrl-C` で、Puma停止

コンテナ停止
```
$ docker-compose down
```

### コマンドライン、shell

コンテナ名を確認後、シェル起動
```
$ docker ps  # コンテナ名を確認
$ docker exec -it [コンテナ名] /bin/bash
```





