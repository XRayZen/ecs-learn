FROM golang:1.22.5

WORKDIR /ecs-learn
# WORKDIR /workspace

# install go tools（自動補完等に必要なツールをコンテナにインストール）
# Ctrl + Shift + P -> Go: Install/Update Tools
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install github.com/ramya-rao-a/go-outline@latest
RUN go install github.com/cweill/gotests/...@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/haya14busa/goplay/cmd/goplay@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
# div-dap のインストール方法は次のドキュメントを参考:
# https://github.com/golang/vscode-go/blob/v0.26.0/docs/dlv-dap.md#updating-dlv-dap
RUN GOBIN=/tmp/ go install github.com/go-delve/delve/cmd/dlv@master \
  && mv /tmp/dlv $GOPATH/bin/dlv-dap
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
RUN go install golang.org/x/tools/gopls@latest

# DockerCLIをインストール 実行しているチップが armなら：arm64 x86なら：amd64
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce-cli


# oh-my-bashをインストール
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# oh-my-bashのテーマを変更
RUN sed -i 's/OSH_THEME=.*/OSH_THEME="powerline-multiline"/g' ~/.bashrc

# oapi-codegenをインストール
RUN go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@v1.13.0

# lessをインストール
RUN apt-get install -y less