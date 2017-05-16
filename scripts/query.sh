# echo "requesting auth-token"
#
# KEYSTONE_AUTH_TOKEN=$(curl -XPOST http://localhost:35357/v2.0/tokens/ \
# 	-H "Content-Type: application/json" \
# 	-d '{
# 	   "auth":
# 	   {
# 	      "tenantName": "mini-mon",
# 	      "passwordCredentials":
# 	      {
# 	         "username": "mini-mon",
# 	         "password": "password"
# 	      }
# 	   }
# 	}' | \
# jq '.access.token.id' | \
# sed -e 's/^"//' -e 's/"$//')
#
# echo "received token: $KEYSTONE_AUTH_TOKEN"
#
# echo "querying nova logs"
# NOVA_LOGS=$(curl -XGET http://localhost:8090/v3.0/logs?dimensions=type:nova \
# 	-H "X-Auth-Token: $KEYSTONE_AUTH_TOKEN" \
# 	-H "Accept: application/json")
#
# echo "$NOVA_LOGS"

# query Elasticsearch for all Keystone logs
curl localhost:9200/keystone-*/_search?pretty
