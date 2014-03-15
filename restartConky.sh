# restarts conky. Last line starts the fan drivers for my laptop. You can remove them.

killall -SIGUSR1 conky
sudo modprobe -v i8k