#!/usr/bin/env bash
hugo --minify
cd public; tar czf x *
scp x sg:/tmp/
ssh sg "sudo rm -rf /var/www/html/Hello.com/docs/* && sudo tar xzf /tmp/x -C /var/www/html/Hello.com/docs/ && /bin/rm /tmp/x && sudo chown www-data:www-data /var/www/html/Hello.com/docs/ -R"
/bin/rm x
cd -
