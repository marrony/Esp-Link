python ./esptool/esptool.py -p /dev/cu.usbmodem14521 -b 9600 write_flash -ff 80m -fm qio -fs 32m ./firmware/user1.bin

#python ./esptool/esptool.py -p /dev/cu.usbmodem14521 -b 9600 write_flash -ff 80m -fm qio -fs 32m 0x0000 ./FirstBurn/boot_v1.4.bin 0x1000 ./firmware/user1.bin 0x3FC000 FirstBurn/esp_init_data_UNOWIFI.bin 0x3FE000 FirstBurn/blank.bin

