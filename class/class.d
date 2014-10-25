import std.stdio;

class MyClass {
	string Msg = "Hello World object!";

	void print () {
		writeln(this.Msg);
	}
}

void main() {
	MyClass it = new MyClass;
	it.print();
}

