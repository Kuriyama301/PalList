FROM node:20.10.0

WORKDIR /app

# 特定のバージョンのnpmをインストール
RUN npm install -g npm@10.2.3

# package.jsonとpackage-lock.jsonをコピー
COPY package*.json ./

# 依存関係のインストール
RUN npm install

# アプリケーションのコピー
COPY . .

# 開発サーバーのポートを開放
EXPOSE 5173

# 開発サーバーの起動
CMD ["npm", "run", "dev", "--", "--host"]