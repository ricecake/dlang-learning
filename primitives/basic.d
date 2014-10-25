import std.stdio;

void main () {
	char[] a = "hello world!".dup;
	foreach (int i, char c; a) {
		writefln("a[%d] = '%c'", i, c);
	}
}
