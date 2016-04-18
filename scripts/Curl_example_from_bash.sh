ENDPOINT="http://jisc.learninglocker.net/data/xAPI/statements?offset=100"

# Have bash encode the credentials to base64
# add your username and password to generate
USER=""
PASS=""
AUTH=$(echo -n "$USER:$PASS" | base64)

# For later if you want to post / get a statement. Not used yet
STMT='/aggregate/time?match={
  "statement.timestamp": {
    "$gt":"2015-01-01T00:00",
    "$lt":"2017-01-02T00:00"
  },
  "statement.actor.mbox": "mailto:ex@mple.com",
  "voided": false
}
'

#curl -i -X POST -H "X-Experience-API-Version: 1.0.1" -H "Authorization: Basic $AUTH" --data-binary "$STMT" $ENDPOINT
curl -i -X GET  -H "X-Experience-API-Version: 1.0.1" -H "Authorization: Basic $AUTH"  $ENDPOINT