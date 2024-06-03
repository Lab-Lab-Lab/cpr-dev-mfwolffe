#!/bin/bash
git remote add upstream https://github.com/Lab-Lab-Lab/cpr-dev.git
echo "setup.sh 01" >> /var/log/cpr-dev.log
git clone https://github.com/Lab-Lab-Lab/CPR-Music-Backend.git CPR-Music-Backend
echo "setup.sh 02" >> /var/log/cpr-dev.log
git clone https://github.com/Lab-Lab-Lab/CPR-Music.git CPR-Music
echo "setup.sh 03" >> /var/log/cpr-dev.log
cd CPR-Music-Backend 
echo "setup.sh 04" >> /var/log/cpr-dev.log
cp .env.local .env 
echo "setup.sh 05" >> /var/log/cpr-dev.log

if [ "$CODESPACES" = "true" ]; then
  echo "setup.sh 05.1" >> /var/log/cpr-dev.log
  echo "CORS_ALLOWED_ORIGIN_REGEXES=^http://localhost:3000$,^https://$CODESPACE_NAME-3000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN$"  >> .env
else
  echo "setup.sh 05.2" >> /var/log/cpr-dev.log
  echo "CORS_ALLOWED_ORIGIN_REGEXES=^http://localhost:3000$"  >> .env
fi

echo "setup.sh 06" >> /var/log/cpr-dev.log
pip install -r requirements/local.txt --no-input 
echo "setup.sh 07" >> /var/log/cpr-dev.log
python manage.py migrate 
echo "setup.sh 08" >> /var/log/cpr-dev.log
python manage.py createsuperuser --no-input
echo "setup.sh 09" >> /var/log/cpr-dev.log
# python manage.py runserver &  #put in postAttach instead
echo "setup.sh 10" >> /var/log/cpr-dev.log
cd .. 
echo "setup.sh 11" >> /var/log/cpr-dev.log
cd CPR-Music 
echo "setup.sh 12" >> /var/log/cpr-dev.log
npm ci 
echo "setup.sh 13" >> /var/log/cpr-dev.log
if [ "$CODESPACES" = "true" ]; then
  echo "setup.sh 13.1" >> /var/log/cpr-dev.log
  echo "NEXT_PUBLIC_BACKEND_HOST=\"https://$CODESPACE_NAME-8000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN\"
NEXTAUTH_URL=\"https://$CODESPACE_NAME-3000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN\"
" > .env.local
else
  echo "setup.sh 13.2" >> /var/log/cpr-dev.log
fi
echo "setup.sh 16" >> /var/log/cpr-dev.log
# npm run dev & #put in postAttach instead
echo "setup.sh 17" >> /var/log/cpr-dev.log
cd ..
echo "setup.sh 18" >> /var/log/cpr-dev.log
if [ "$CODESPACES" = "true" ]; then
  echo "setup.sh 19" >> /var/log/cpr-dev.log
  gh codespace ports -c $CODESPACE_NAME visibility 3000:public 8000:public
  echo "setup.sh 20" >> /var/log/cpr-dev.log
else
  echo "setup.sh 19" >> /var/log/cpr-dev.log
fi
