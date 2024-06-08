net start w32time

w32tm /resync

w32tm /config /syncfromflags:manual /manualpeerlist:time.nist.gov

exit