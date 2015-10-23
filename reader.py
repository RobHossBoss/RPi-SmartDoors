from uuid import getnode as get_mac
import MySQLdb
import RPi.GPIO as GPIO
import time

def hammertime():
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(11, GPIO.OUT, initial=True)
    GPIO.output(11,0)
    time.sleep(4)
    GPIO.output(11, 1)
    print "hammer thrown!"

def main():

    GPIO.setmode(GPIO.BOARD)    
    GPIO.setup(11, GPIO.OUT, initial=True)
    GPIO.output(11, 1)
    GPIO.cleanup()


    db = MySQLdb.connect("urcpp.berea.edu","dooraccess","DanforthDoor2015","DoorAccess")
    mac = str(get_mac())
    print mac
    with db:
        curs=db.cursor()
        curs.execute('SELECT Room FROM DoorAccess.Scanners WHERE Scanners.ID = "'+str(mac)+'"')
	room = int(curs.fetchone()[0])
    while True:            
        readerscan = str(raw_input('waiting'))
        with db:
            curs=db.cursor()
            curs.execute('Select Mode from DoorAccess.Scanners Where ID="'+mac+'"')
            result = curs.fetchone()[0]
#            print result
            print('Here we go')
            if result == 1:
 #               print ('SELECT * FROM DoorAccess.UsersInRoom WHERE UserInRoom.User = "'+readerscan+'" AND UsersInRoom.Room = "'+str(room)+'"')
                num = curs.execute('SELECT * FROM DoorAccess.UsersInRoom WHERE UsersInRoom.User = "'+readerscan+'" AND UsersInRoom.Room = "'+str(room)+'"')
                if num > 0:
                    result1 = curs.fetchone()[0]
                    
                    if result1:
                        hammertime()
                    else:
                        print 'access denied'
                else:
                        print 'access denied'
            else:
                later = 'we will have to query the database later to check to see if the user has access to two rooms'
                inser= ("INSERT INTO DoorAccess.Users (ID) VALUES (%s);")
                data= (readerscan)
                curs.execute(inser,data)
                db.commit()
                print room
                inser1= ("INSERT INTO DoorAccess.UsersInRoom (User, Room)VALUES (%s,%s);")
                data1=(readerscan,room)
                curs.execute(inser1,data1)
                db.commit()
                curs.close()
                
                
main()
