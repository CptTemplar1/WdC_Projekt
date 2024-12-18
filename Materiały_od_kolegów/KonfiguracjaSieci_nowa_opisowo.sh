KONFIGURACJA URZĄDZEŃ SIECIOWYCH

############################################################################################################
#Centrum
#R0
enable
configure terminal

service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname R0

enable password class

aaa new-model
aaa authentication login default group tacacs+ local

no ip cef
no ipv6 cef

username cisco secret cisco

license udi pid CISCO1941/K9 sn FTX1524PNC4-

ip domain-name r0

spanning-tree mode pvst

interface Loopback0
 no ip address
 shutdown
 exit

interface GigabitEthernet0/0
 ip address 193.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface Serial0/0/0
 ip address 1.0.0.2 255.0.0.0
 exit

interface Serial0/0/1
 ip address 5.0.0.1 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/1/0
 ip address 4.0.0.1 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/1/1
 no ip address
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 192.168.1.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 exit

ip classless
ip flow-export version 9

tacacs-server host 193.168.1.3
tacacs-server host 192.168.3.1
tacacs-server key cisco

logging 193.168.1.3

line con 0
 password 7 cisco
 login authentication default
 exit

line aux 0
 exit

line vty 0 4
 password 7 cisco
 transport input ssh
 exit

line vty 5 15
 password 7 cisco
 transport input ssh
 exit

ntp server 193.168.1.3

end


#Router1
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname R1

enable password class

no ip cef
no ipv6 cef

license udi pid CISCO1941/K9 sn FTX1524HY87-

ip domain-name r1

spanning-tree mode pvst

interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/0.10
 encapsulation dot1Q 10
 ip address 192.168.1.1 255.255.255.0
 exit

interface GigabitEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.2.2 255.255.255.0
 exit

interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface Serial0/0/0
 ip address 1.0.0.1 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/0/1
 ip address 2.0.0.1 255.0.0.0
 exit

#do konfiguracji DMZ
interface Serial0/1/0
 no ip address
 clock rate 2000000
 exit

interface Serial0/1/1
 no ip address
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 192.168.1.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 exit

ip classless
ip flow-export version 9

line con 0
 password cisco
 login
 exit

line aux 0
 exit

line vty 0 4
 password cisco
 login
 exit

line vty 5 15
 password cisco
 login
 exit

end


#R2
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname R2

enable password class

no ip cef
no ipv6 cef

username cisco secret cisco

license udi pid CISCO1941/K9 sn FTX15246M6S-

ip domain-name r2

spanning-tree mode pvst

interface GigabitEthernet0/0
 ip address 194.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/1
 ip address 195.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface Serial0/0/0
 ip address 2.0.0.2 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/0/1
 ip address 3.0.0.1 255.0.0.0
 exit

 interface Serial0/1/0
 ip address 7.0.0.1 255.0.0.0
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 192.168.1.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 exit

ip classless
ip flow-export version 9

line con 0
 password cisco
 login
 exit

line aux 0
 exit

line vty 0 4
 password cisco
 login local
 transport input ssh
 exit

line vty 5 15
 password cisco
 login
 exit

end