#!/bin/sh
mail -s "$1 is empty" -r "${{ secrets.MAIL_FROM }}" -S smtp="smtp://${{ secrets.MAIL_SMTP }}:587" \
                              -S smtp-auth=login \
                              -S smtp-auth-user="${{ secrets.MAIL_USER }}" \
                              -S smtp-auth-password="${{ secrets.MAIL_PASS }}" \
                              -S sendwait \
                              "${{ secrets.MAIL_TO }}" <<< "UPD: $1 is empty, list creation process stopped."
