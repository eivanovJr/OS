8
1411:/usr/lib/systemd/systemd --user
1416:(sd-pam)
1422:-bash
1824:/bin/bash ./task1.bash
1825:/bin/bash ./task1.bash
1826:ps -u user o pid,command
1827:tail -n +2
1828:sed -r s/\s*([0-9]+)\s(.+)$/\1:\2/
