#!/bin/bash
git clone https://github.com/$GITHUB_USER/CPR-Music-Backend.git 
git clone https://github.com/$GITHUB_USER/CPR-Music.git 
cd CPR-Music-Backend 
# probably will 
git checkout version-updates
cp .env.local .env 
echo "CORS_ALLOWED_ORIGIN_REGEXES=^http://localhost:3000$,^https://$CODESPACE_NAME-3000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN$"  >> .env
pip install -r requirements/local.txt --no-input 
python manage.py migrate 
python manage.py createsuperuser --no-input
# python manage.py runserver &  #put in postAttach instead
cd .. 
cd CPR-Music 
git checkout version-updates
npm ci 
echo "NEXT_PUBLIC_BACKEND_HOST=\"https://$CODESPACE_NAME-8000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN\"
NEXTAUTH_URL=\"https://$CODESPACE_NAME-3000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN\"
" > .env.local
# npm run dev & #put in postAttach instead
cd ..
gh codespace ports -c $CODESPACE_NAME visibility 3000:public 8000:public
