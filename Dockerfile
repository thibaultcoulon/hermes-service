FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl git xz-utils && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | NONINTERACTIVE=1 CI=1 bash || true

ENV PATH="/root/.local/bin:${PATH}"

EXPOSE 8080

CMD ["hermes", "gateway", "run"]
