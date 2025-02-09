FROM ruby:3.2.2

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs npm tesseract-ocr

# Yarnのインストール
RUN npm install -g yarn

# 作業ディレクトリの作成
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile* ./

# Bundlerの実行
RUN bundle install

# アプリケーションのコピー
COPY . .

# エントリーポイントスクリプトの実行権限を付与
RUN chmod +x /app/bin/docker-entrypoint

ENTRYPOINT ["/app/bin/docker-entrypoint"]

# Railsサーバーの起動
CMD ["rails", "server", "-b", "0.0.0.0"]