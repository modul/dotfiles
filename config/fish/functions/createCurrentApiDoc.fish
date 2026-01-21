function createCurrentApiDoc
    cp docs/api.yml (jq -r .name package.json)-v(jq -r .version package.json).yml
end
