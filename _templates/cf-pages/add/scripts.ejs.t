---
to: package.json
inject: true
skip_if: '"pages:deploy"'
after: "scripts"
---
    "pages:deploy": "npm run build && wrangler pages deploy --project-name '<%= name %>' '<%= locals.dir || 'dist' %>'",