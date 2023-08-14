---
to: .github/workflows/<%= locals.workflow || 'pages-deploy' %>.yml
unless_exists: true
---
on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Deploy
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
          cache: <%= locals.npm || 'yarn' %>
      - run: <%= locals.npm || 'yarn' %> install
      - name: Deploy
        uses: cloudflare/wrangler-action@3.0.0
        with:
          apiToken: ${{ secrets.CF_API_TOKEN }}
          accountId: ${{ secrets.CF_ACCOUNT_ID }}
          command: <%= locals.npm || 'yarn' %> pages:deploy
