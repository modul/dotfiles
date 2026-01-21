function parameterStoreParameters
    aws ssm get-parameters-by-path --recursive --path /Config/Dev/VpoOrderService --with-decryption | jq '.Parameters | map("aws ssm put-parameter --name " + .Name + " --type " + .Type + " --value \'" + .Value + "\' --overwrite")'
end
