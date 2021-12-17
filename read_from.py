# read_from.py reads queries from socket 1137 at IP
import socket, atexit, time, sys


def cleanup():
    sock.send("quit\n".encode())
    sock.close()


if len(sys.argv) < 2:
    print("Usage: read_from.py IP <list of queries>")
    sys.exit(2)
else:
    atexit.register(cleanup)
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((sys.argv[1], 1137))  # socket 1137
    out = ''
for query in sys.argv[2:]:
    query_str = query + "?\n"
    sock.send(query_str.encode())
    #print("query send...")
    time.sleep(1)
    reply = sock.recv(4096)
    #print("data received...")
    if (len(out)) > 0:
        out += ':'
    out += reply.decode()[len(query):].strip()
print(out)
