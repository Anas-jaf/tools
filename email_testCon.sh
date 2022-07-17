#!/bin/bash

wget -q --spider http://google.com

if [ $? -eq 0 ]; then

curl --ssl-reqd \
-url 'smtp://smtp.mailtrap.io:2525' \
--user '<your username>' \
--mail-from from@example.com \
--mail-rcpt to@example.com \
--upload-file - <<EOF
From: Magic Elves <from@example.com>
To: Mailtrap Inbox <to@example.com>
Subject: hi from poe+ pi
Content-Type: multipart/alternative; boundary="boundary-string"

--boundary-string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

pi is connected to the internet  at date and time  :
`date "+DATE: %D%nTIME: %r"`
--boundary-string--
EOF

fi

# sudo -S rm -- "$0"
