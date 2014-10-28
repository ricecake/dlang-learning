import std.string, std.conv, std.stream, std.stdio;
import std.socket, std.socketstream;

void main() {

    Socket sock = new TcpSocket(new InternetAddress("google.com", 80));
    scope(exit) sock.close();
    Stream ss   = new SocketStream(sock);

    ss.writeString("GET / HTTP/1.0\r\n"
                   "Host: google.com\r\n"
                   "\r\n");

    while (!ss.eof()) {
        auto line = ss.readLine();
        writeln(line);
    }
}

