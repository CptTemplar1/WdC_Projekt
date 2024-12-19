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


#R1
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
 no shutdown
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
 no shutdown
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



############################################################################################################
#VLANs
#S1
enable
configure terminal

service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname S1

enable password class

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 switchport mode trunk
 no shutdown
 exit

interface FastEthernet0/2
 switchport access vlan 10
 switchport mode access
 no shutdown
 exit

interface FastEthernet0/3
 switchport access vlan 20
 switchport mode access
 no shutdown
 exit

interface Vlan1
 ip address 192.168.1.2 255.255.255.0
 no shutdown
 exit

interface Vlan2
 ip address 192.168.1.5 255.255.255.252
 no shutdown
 exit

interface Vlan3
 ip address 192.168.1.9 255.255.255.252
 no shutdown
 exit

ip default-gateway 192.168.1.1

line con 0
 password cisco
 login
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


############################################################################################################
#ZPF
#R4
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname R4

enable password class

no ip cef
no ipv6 cef

username cisco secret cisco

license udi pid CISCO1941/K9 sn FTX1524B1Z1-
#ZPF wymaga tej paczki
license boot module c1900 technology-package securityk9

spanning-tree mode pvst

#ZPF
zone security IN-ZONE
 exit
zone security OUT-ZONE
 exit
access-list 101 permit ip 198.168.1.0 0.0.0.255 any
class-map type inspect match-all IN-NET-CLASS-MAP
 match access-group 101
 exit
policy-map type inspect IN-2-OUT-PMAP
 class type inspect IN-NET-CLASS-MAP
  inspect
 exit
 exit
zone-pair security IN-2-OUT-ZPAIR source IN-ZONE destination OUT-ZONE
 service-policy type inspect IN-2-OUT-PMAP
 exit

interface GigabitEthernet0/0
 ip address 198.168.1.1 255.255.255.0
 #ZPF
 zone-member security IN-ZONE
 duplex auto
 speed auto
 no shutdown
 exit

interface GigabitEthernet0/1
 ip address 192.168.3.1 255.255.255.0
 duplex auto
 speed auto
 no shutdown
 exit

interface Serial0/0/0
 ip address 7.0.0.2 255.0.0.0
 #ZPF
 zone-member security OUT-ZONE
 clock rate 2000000
 no shutdown
 exit

interface Serial0/0/1
 ip address 10.2.2.1 255.255.255.252
 clock rate 2000000
 no shutdown
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 7.0.0.0
 network 197.168.1.0
 network 198.168.1.0
 exit

ip classless
ip route 0.0.0.0 0.0.0.0 10.2.2.2 

ip flow-export version 9

line con 0
 login
 exit

line aux 0
 exit

line vty 0 4
 password ciscovtypa55
 login
 exit

end


#S10
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S10

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 no shutdown
 exit

interface GigabitEthernet0/1
 no shutdown
 exit

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
#SPAN
#S9
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname S9

enable password class

#SPAN
monitor session 1 source interface Fa0/1
monitor session 1 destination interface Fa0/2

spanning-tree mode pvst
spanning-tree extend system-id

interface Vlan1
 ip address 194.168.1.2 255.255.255.0
 no shutdown
 exit

ip default-gateway 194.168.1.1

line con 0
 password cisco
 login
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



############################################################################################################
#STP
#S4
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S4

no ip domain-lookup

#STP
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 1 root primary

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end


#S5
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S5

no ip domain-lookup

#STP
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 1 root secondary

interface FastEthernet0/2
 spanning-tree guard root
 exit

interface FastEthernet0/3
 spanning-tree guard root
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



#S6
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S6

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/3
 spanning-tree guard root
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



#S7
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S7

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit

#STP
interface FastEthernet0/3
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit
interface FastEthernet0/4
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



#S8
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S8

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit

#STP
interface FastEthernet0/3
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit
interface FastEthernet0/4
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit


interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end