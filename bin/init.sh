#! /bin/bash

env

cat /logstash/config/logstash.in |
sed -e "s/%%ES_BIND_HOST%%/${ES1_PORT_9300_TCP_ADDR}/" |
sed -e "s/%%TWITTER_CONSUMER_KEY%%/${TWITTER_CONSUMER_KEY}/" |
sed -e "s/%%TWITTER_CONSUMER_SECRET%%/${TWITTER_CONSUMER_SECRET}/" |
sed -e "s/%%TWITTER_OAUTH_TOKEN%%/${TWITTER_OAUTH_TOKEN}/" |
sed -e "s/%%TWITTER_OAUTH_TOKEN_SECRET%%/${TWITTER_OAUTH_TOKEN_SECRET}/" >/logstash/config/logstash.conf

echo "............"
echo "Using config file:"
cat /logstash/config/logstash.conf
echo "............"

/logstash/bin/logstash -f /logstash/config/logstash.conf
