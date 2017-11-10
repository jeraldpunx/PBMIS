#!/bin/bash
# initialize all microservices for local development
# before using, take note of the following
# be sure nga naa mo installed pm2 globally
# be sure nga naa mo sa develop branch on each microservices
# be sure nga updated each microservices
# be sure nga running inyu local mongodb

# define array of microservices
micro=("inventory" "company" "accounting" "production" "transaction" "system" "messenger" "broker")


# change directory on each microservice
for i in "${micro[@]}"
do
  cd 'pbmis.'$i
  sleep 2
  mongoUrl=mongodb://localhost:27017/pandesal pm2 start ./bin/www --name=$i --watch
  cd ..
  sleep 3
done

sleep 5
pm2 list
sleep 10
# restart broker.... because broker
pm2 restart broker
sleep 5
echo ' '
echo 'Exiting...'
# nodemon on each, define mongoUrl

echo
echo '#####################################################################'
echo '##                                                                 ##'
echo '## - microservices started locally                                 ##'
echo '## - go to your local erp-web-app directory                        ##'
echo '## - and run `sudo ng serve --env=local`                           ##'
echo '##                                                                 ##'
echo '#####################################################################'
echo
