# if rc.local doesn't exist, create it
if [ ! -e $ROOT/etc/rc.d/rc.local ]; then
        echo "#!/bin/sh" > $ROOT/etc/rc.d/rc.local
        chmod 755 $ROOT/etc/rc.d/rc.local
fi

# apply a check to remove any stale PAM console.lock files.
grep "rm -f /var/run/console/" $ROOT/etc/rc.d/rc.local > /dev/null
if [ $? != 0 ]; then
        echo "" >> $ROOT/etc/rc.d/rc.local
        echo "# Delete pam_console lock and refcount files" >> $ROOT/etc/rc.d/rc.local
        echo "rm -f /var/run/console/*" >> $ROOT/etc/rc.d/rc.local
fi

config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

