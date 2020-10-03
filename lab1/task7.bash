#!/bin/bash

mails=$(grep -orhIE "[[:alnum:]]+\@[[:alnum:]]+\.[[:alnum:]]+" /etc)
echo $mails > email.list
