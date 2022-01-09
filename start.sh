if [[ -n $ACCOUNTS_ZIP_URL ]]; then
        echo "accounts.zip detected" 
	wget -q $ACCOUNTS_ZIP_URL -O /usr/src/app/zip_path
fi

echo "[General]
path_to_gclone = ./gclone
telegram_token = $telegram_token
user_ids = $user_ids
group_ids = $group_ids
gclone_para_override = $gclone_para_override" >> "telegram_gcloner/config.ini"
npm install http-server -g
http-server -p $PORT &
python3 telegram_gcloner/telegram_gcloner.py
