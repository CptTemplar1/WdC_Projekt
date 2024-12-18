KONFIGURACJA URZĄDZEŃ SIECIOWYCH

############################################################################################################
#Centrum
#R0
enable
configure terminal

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

#NTP
ntp server 193.168.1.3
service timestamps log datetime msec
no service timestamps debug datetime msec
interface Loopback0
 no ip address
 no shutdown
 shutdown
 exit

#CISCO IOS
logging 193.168.1.3
interface Loopback0
 no ip address
 no shutdown
 shutdown
 exit

interface GigabitEthernet0/0
 ip address 193.168.1.1 255.255.255.0
 duplex auto
 speed auto
 no shutdown
 exit

interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface Serial0/0/0
 ip address 1.0.0.2 255.0.0.0
 no shutdown
 exit

interface Serial0/0/1
 ip address 5.0.0.1 255.0.0.0
 clock rate 2000000
 no shutdown
 exit

interface Serial0/1/0
 ip address 4.0.0.1 255.0.0.0
 clock rate 2000000
 no shutdown
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

#TACAACS+
tacacs-server host 192.168.1.3
tacacs-server key cisco
aaa new-model
aaa authentication login default group tacacs+ local
line console 0
login authentication default

line con 0
 password cisco
 login authentication default
 exit

line aux 0
 exit

line vty 0 4
 password cisco
 transport input ssh
 exit

line vty 5 15
 password cisco
 transport input ssh
 exit

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
 no shutdown
 exit

interface GigabitEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.2.2 255.255.255.0
 no shutdown
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
 no shutdown
 exit

interface Serial0/0/1
 ip address 2.0.0.1 255.0.0.0
 no shutdown
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
 no shutdown
 exit

interface GigabitEthernet0/1
 ip address 195.168.1.1 255.255.255.0
 duplex auto
 speed auto
 no shutdown
 exit

interface Serial0/0/0
 ip address 2.0.0.2 255.0.0.0
 clock rate 2000000
 no shutdown
 exit

interface Serial0/0/1
 ip address 3.0.0.1 255.0.0.0
 no shutdown
 exit

 interface Serial0/1/0
 ip address 7.0.0.1 255.0.0.0
 no shutdown
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



############################################################################################################
#ACL
#Router3
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname R3

enable password class

no ip cef
no ipv6 cef

username cisco secret cisco

license udi pid CISCO2911/K9 sn FTX1524KB94-

spanning-tree mode pvst

#ACL
access-list 100 permit icmp any any
access-list 100 deny ip any 196.168.10.0 0.0.0.255
access-list 100 deny ip 196.168.10.0 0.0.0.255 any
access-list 100 permit ip any any

interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface GigabitEthernet0/1
 ip address 196.168.10.1 255.255.255.0
 ip access-group 100 in
 duplex auto
 speed auto
 no shutdown
 exit

interface GigabitEthernet0/2
 ip address 196.168.20.1 255.255.255.0
 ip access-group 100 in
 duplex auto
 speed auto
 no shutdown
 exit

interface Serial0/3/0
 ip address 4.0.0.2 255.0.0.0
 no shutdown
 exit

interface Serial0/3/1
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
 exit

line aux 0
 exit

line vty 0 4
 login
 exit

end


#S2
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S2

spanning-tree mode pvst
spanning-tree extend system-id

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end


#S3
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S3

spanning-tree mode pvst
spanning-tree extend system-id

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



############################################################################################################
#DHCP, NTP, CISCO IOS, TACACS+
#S0
enable
configure terminal

service password-encryption

hostname S0

enable password class

ip domain-name s0

username cisco secret cisco

spanning-tree mode pvst
spanning-tree extend system-id

#NTP
ntp server 193.168.1.3
service timestamps log datetime msec
no service timestamps debug datetime msec

#CISCO IOS
logging 193.168.1.3

interface Vlan1
 ip address 193.168.1.2 255.255.255.0
 no shutdown
 exit

ip default-gateway 193.168.1.1

line con 0
 password cisco
 login
 exit

line vty 0 4
 password cisco
 login local
 transport input ssh
 exit

line vty 5 15
 password cisco
 login local
 transport input ssh
 exit

end