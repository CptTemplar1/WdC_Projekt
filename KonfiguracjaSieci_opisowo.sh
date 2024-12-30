############################################################################################################
############################################################################################################
SCHEMAT SIECI
############################################################################################################
3 Routery połączone ze sobą będące centrum sieci
R0 Se0/0/0 - R1 Se0/0/0
R1 Se0/0/1 - R2 Se0/0/0
R2 Se0/0/1 - R0 Se0/0/1

Od Routerów odchodzą poszczególne podsieci
PODSIEĆ 3 (DHCP, NTP, CISCO IOS, TACACS+)
R0 Gig0/0 - S0 Fa0/1
S0 Fa0/2 - PC0 Fa0
S0 Fa0/3 - Server0 Fa0
S0 Fa0/4 - PC1 Fa0

PODSIEĆ 1 (VLANY)
R1 Gig0/0 - S1 Fa0/1
S1 Fa0/2 - PC2 Fa0
S1 Fa0/3 - PC3 Fa0

PODSIEĆ 2 (ACL)
R0 Se0/1/0 - R3 Se0/3/0
R3 Gig0/1 - S2 Fa0/1
S2 Fa0/2 - PC4 Fa0
R3 Gig0/2 - S3 Fa0/1
S3 Fa0/2 - PC5 Fa0
S3 Fa0/3 - PC6 Fa0

PODSIEĆ 6 (STP)
R2 Gig0/1 - S4 Fa0/1
S4 Fa0/2 - S5 Fa0/2
S4 Fa0/3 - S6 Fa0/1
S5 Fa0/1 - S6 Fa0/2
S5 Fa0/3 - S7 Fa0/1
S6 Fa0/3 - S8 Fa0/2
S7 Fa0/2 - S8 Fa0/1
S7 Fa0/3 - PC7 Fa0
S7 Fa0/4 - PC8 Fa0
S8 Fa0/3 - PC9 Fa0
S8 Fa0/4 - PC10 Fa0

PODSIEĆ 4 (SPAN)
R2 Gig0/0 - S9 Fa0/1
S9 Fa0/2 - Sniffer0 Eth0
Sniffer0 Eth1 - PC12 Fa0
S9 Fa0/3 - PC11 Fa0

PODSIEĆ 5 (ZPF)
R2 Se0/1/0 - R4 Se0/0/0
R4 Gig0/0 - S10 Gig0/1
S10 Fa0/1 - PC13 Fa0

PODSIEĆ 7 (DMZ)
R1 Gig0/1 - ASA0 Gig1/1
ASA0 Gig1/2 - S11 Fa0/1
S11 Fa0/2 - PC14 Fa0
S11 Fa0/3 - UntrustedServer Fa0
S11 Fa0/4 - PC15 Fa0
ASA0 Gig1/3 - S12 Fa0/1
S12 Fa0/2 - WEB SERVER Fa0
S12 Fa0/3 - DNS SERVER Fa0
S12 Fa0/4 - EMAIL SERVER Fa0


############################################################################################################
############################################################################################################
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
 network 197.168.10.0
 exit

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
write memory


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

#Interfejs zewnętrzny (połączony z ASA0)
interface GigabitEthernet0/1
 description To ASA0
 ip address 197.168.10.1 255.255.255.0
 no shutdown

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
 network 197.168.10.0
 exit

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
write memory


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


#SSH
ip domain-name r2
username cisco secret cisco
crypto key generate rsa general-keys modulus 1024
line vty 0 4
 transport input ssh
 login local
 exit

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
 network 197.168.10.0
 exit

ip flow-export version 9

line con 0
 password cisco
 login
 exit

line aux 0
 exit

line vty 5 15
 password cisco
 login
 exit

end
write memory



############################################################################################################
#ACL
#R3
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

spanning-tree mode pvst

#ACL
access-list 100 permit icmp any any
access-list 100 deny ip any 196.168.10.0 0.0.0.255
access-list 100 deny ip 196.168.10.0 0.0.0.255 any
access-list 100 permit ip any any
interface GigabitEthernet0/1
 ip address 196.168.10.1 255.255.255.0
 ip access-group 100 in
 no shutdown
 exit
interface GigabitEthernet0/2
 ip address 196.168.20.1 255.255.255.0
 ip access-group 100 in
 no shutdown
 exit


interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
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
 network 197.168.10.0
 exit

ip flow-export version 9

line con 0
 exit

line aux 0
 exit

line vty 0 4
 login
 exit

end
write memory


#S2
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S2

spanning-tree mode pvst

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
write memory


#S3
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S3

spanning-tree mode pvst

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
write memory



############################################################################################################
#DHCP, SSH, NTP, CISCO IOS, TACACS+
#S0
enable
configure terminal

service password-encryption

hostname S0

enable password class

#SSH
ip domain-name s0
username cisco secret cisco
crypto key generate rsa general-keys modulus 1024
line vty 0 15
 transport input ssh
 login local
 exit


spanning-tree mode pvst

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

end
write memory



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
write memory



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

spanning-tree mode pvst

#ZPF (wymaga tej paczki)
license boot module c1900 technology-package securityk9
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
 network 198.168.1.0
 exit

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
write memory


#S10
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S10

spanning-tree mode pvst

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
write memory


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
write memory



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
write memory


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
write memory



#S6
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S6

no ip domain-lookup

spanning-tree mode pvst

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
write memory



#S7
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S7

no ip domain-lookup

spanning-tree mode pvst

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
write memory



#S8
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname S8

no ip domain-lookup

spanning-tree mode pvst

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
write memory


############################################################################################################
#DMZ
#ASA0
enable
configure terminal

hostname ASA0

enable password class

interface GigabitEthernet1/1
 nameif inside
 security-level 100
 ip address 197.168.10.2 255.255.255.0
 no shutdown
 exit

interface GigabitEthernet1/2
 nameif outside
 security-level 0
 ip address 203.0.113.1 255.255.255.0
 no shutdown
 exit

interface GigabitEthernet1/3
 nameif dmz
 security-level 50
 ip address 197.168.20.1 255.255.255.0
 no shutdown
 exit

#Konfiguracja tras statycznych
route outside 0.0.0.0 0.0.0.0 203.0.113.2
route inside 197.168.1.0 255.255.255.0 197.168.10.1

#Konfiguracja NAT
object network obj_internal
 subnet 197.168.1.0 255.255.255.0
 nat (inside,outside) dynamic interface

object network obj_dmz
 subnet 197.168.20.0 255.255.255.0
 nat (dmz,outside) dynamic interface

#Dostęp dla ruchu z DMZ do zewnętrznej sieci
access-list ACL_DMZ_OUTSIDE extended permit tcp any any eq 80
access-list ACL_DMZ_OUTSIDE extended permit tcp any any eq 443
access-group ACL_DMZ_OUTSIDE in interface dmz

#Dostęp dla ruchu z zewnętrznej sieci do DMZ (ograniczony do serwisów)
access-list ACL_OUTSIDE_DMZ extended permit tcp any object obj_dmz eq 80
access-list ACL_OUTSIDE_DMZ extended permit tcp any object obj_dmz eq 443
access-group ACL_OUTSIDE_DMZ in interface outside

#Zakończenie konfiguracji
exit
write memory



#S11 (OUTSIDE)
enable
configure terminal

hostname S11

interface FastEthernet0/1
 switchport mode access
 switchport access vlan 10
 no shutdown
 exit

interface FastEthernet0/2
 switchport mode access
 switchport access vlan 10
 no shutdown
 exit

interface FastEthernet0/3
 switchport mode access
 switchport access vlan 10
 no shutdown
 exit

interface FastEthernet0/4
 switchport mode access
 switchport access vlan 10
 no shutdown
 exit

#Tworzenie VLAN 10 (dla sieci zewnętrznej)
vlan 10
 name Outside_Network

#Zakończenie konfiguracji
exit
write memory



#S12 (DMZ)
enable
configure terminal

hostname S12

interface FastEthernet0/1
 switchport mode access
 switchport access vlan 20
 no shutdown
 exit

interface FastEthernet0/2
 switchport mode access
 switchport access vlan 20
 no shutdown
 exit

interface FastEthernet0/3
 switchport mode access
 switchport access vlan 20
 no shutdown
 exit

interface FastEthernet0/4
 switchport mode access
 switchport access vlan 20
 no shutdown
 exit

#Tworzenie VLAN 20 (dla DMZ)
vlan 20
 name DMZ_Network

#Zakończenie konfiguracji
exit
write memory