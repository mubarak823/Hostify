# -*- coding=utf-8 -*-
#qpy:console
from __future__ import print_function
import urllib2, socket, os, glob
print ("------------------------------------")
print ("    By Mafia - @SD_MAFIA")
print ("------------------------------------")
def Http():
    for i in satir:
        kd=str(i)
        sira=kd.find(" ")
        host=kd[:sira]
        print(host)
        urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler({"http":"turbohide.com:80"})))
        try:
            site="http://"+host
            urllib2.urlopen(site)
            print("SUCCESS")
        except Exception:
            print("FAILED")
def Host():
    for i in satir:
        kd=str(i)
        sira=kd.find(" ")
        host=kd[:sira]
        print(host)
        request= urllib2.Request("http://turbohide.com", headers={"Host" : host})
        try:
            urllib2.urlopen(request)
            print("SUCCESS")
        except Exception:
            print("FAILED")
def XOnlineHost():
    for i in satir:
        kd=str(i)
        sira=kd.find(" ")
        host=kd[:sira]
        print(host)
        request= urllib2.Request("http://turbohide.com", headers={"X-Online-Host" : host})
        try:
            urllib2.urlopen(request)
            print("SUCCESS")
        except Exception:
            print("FAILED")
def Referer():
    for i in satir:
        kd=str(i)
        sira=kd.find(" ")
        host=kd[:sira]
        print(host)
        request= urllib2.Request("http://turbohide.com", headers={"Referer" : host})
        try:
            urllib2.urlopen(request)
            print("SUCCESS")
        except Exception:
            print("FAILED")
def IpTara():
    Gfile = open("file.txt","r")
    Dhost = (str.strip(Gfile.readline()))
    site = socket.gethostbyname(Dhost)
    SepIp = site.split(".")
    Ip4 = SepIp[3]
    Ip4Int = Ip4;
    Ip3 = SepIp[2]
    Ip3Int = int(Ip3)
    Ip2 = SepIp[1]
    Ip1 = SepIp[0]
    
    countFrom = raw_input(Ip3+' To :')
    
    ShowIpAd = raw_input('Show As Ip :')
    if ShowIpAd == 'yes':
        ShowAsIp = True
    else :
        ShowAsIp = False
        
    os.system('clear')
    print ("-"*50)
    print('Edited By Mafia :) From:' +Ip3+' TO '+ countFrom)
    print ("-"*50)
    
    SGg =  int(countFrom) - Ip3Int
    CFile = open("Mafia_FHost.txt","w")
    CFile.close()
    CFileA = []
    for i in range(SGg+1):
                    Ip3 = str(Ip3Int)
                    print (Ip1+"."+Ip2+"."+Ip3+" Started...")
                    for i1 in range(256):
                                    
                                    t4 = str(i1)
                                    try:
                                            print(socket.gethostbyaddr(Ip1+"."+Ip2+"."+Ip3+"."+t4)[0])
                                            ip= str(socket.gethostbyaddr(Ip1+"."+Ip2+"."+Ip3+"."+t4)[2])
                                            uznlk= len(ip)
                                            ip= ip[2:uznlk-2]
                                            ipAsHost =socket.gethostbyaddr(Ip1+"."+Ip2+"."+Ip3+"."+t4)[0]
                                            CFileA.append(ipAsHost)
                                            print(ipAsHost+" "+ip, end="\n", file=k2)
                                    except Exception:
                                            if ShowAsIp:
                                                    print(Ip1+"."+Ip2+"."+Ip3+"."+t4)
                    Ip3Int = Ip3Int + 1
    CFile = open("Mafia_FHost.txt","a")
    s2f = raw_input("Save To A File ? Y/N : ")
    if s2f == "Y":
      for HostIn in CFileA:
                      CFile.write(HostIn + "\n")
                            
      CFile.close()
      print("File Saved ! File Name: Mafia_FHost.txt")
IpTara()