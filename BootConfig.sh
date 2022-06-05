#Booting
Select> Arch Linux Install medium (x86_64, BIOS)

#Map keyboard language
loadkeys es
loadkeys us

#Check Internet
ip link
ip a s
ping -c 1 google.com

#Creating Partition
cfdisk
>Select: dos # For virtual machine
>/dev/sda1   # Particion de tipo Linux, para el boot
>/dev/sda2   # Particion de tipo Linux, para el S.O
>/dev/sda3   # Particion de tipo Linux/Swap/Solaris, para el Swap
>lsblk       # Listar los block devices
>fdisk - l   # Listar detalle de las particiones
"Luego seleccionar la particion primaria, y hacer click en 'write' (tipeando 'yes') y luego 'quit'"

#Formating
>mkfs.vfat -F 32 /dev/sda1  
>mkfs.ext4 /dev/sda2
>mkswap /dev/sda3
>swapon 
"Formateamos los device blocks dependiendo del FileSystem que queremos asignarles"

#Mount
> ls /mnt 
> mkdir /mnt/boot 
> mount /dev/sda1 /mnt/boot
> mounr /dev/sda2 /mnt

#Install Kernel Linux, firmware y base package
>pacstrap /mnt linux linux-firmware networkmanager grup wpa_supplicant base base-devel 

