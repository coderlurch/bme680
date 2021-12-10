# read from BME680 and store data to sql db
import socket, atexit, time, sys
import MySQLdb


def cleanup():
    sock.send("quit\n".encode())
    sock.close()


atexit.register(cleanup)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((sys.argv[1], 1137))  # socket 1137
out = ''
for query in ['T', 'P', 'H', 'G']:
    query_str = query + "?\n"
    sock.send(query_str.encode())
    print("query send...")
    time.sleep(1)
    reply = sock.recv(4096)
    print("data received...")
    if (len(out)) > 0:
        out += ':'
    out += reply.decode()[len(query):].strip()
print(out)
T, P, H, G = [float(obj) for obj in out.split(':')]
db = MySQLdb.connect("localhost", "me", "", "readBME680")
print('connected to readBME680 db...')
cur = db.cursor()
sql = f"insert into dat (T,P,H,G) values ({T},{P},{H},{G});"
cur.execute(sql)
db.commit()
db.close()
print('data stored to dat...')
