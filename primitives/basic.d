import std.stdio;

void main () {
	char[] a = "hello world!".dup;
	foreach (int i, char c; a) {
		if (i%2) {
			writeln(i);
		}
		else {
			writeln(c);
		}
		writefln("a[%d] = '%c'", i, c);
	}
}
