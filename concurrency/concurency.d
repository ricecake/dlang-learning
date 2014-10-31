import std.concurrency;
import std.stdio;
import std.string;
import core.thread;

void worker (string name) {
	register(name, thisTid);
	Tid master = locate("master");
	send(master, "Hello, Actors!");

	bool exit = false;
	while(!exit) {
		receive(
			(string Msg) { writeln(Msg); exit = true; },
			(int I) { writeln(I); },
		);
	}
}


void main () {
	register("master", thisTid);
	spawnLinked(&worker, "worker");
	receive(
		(string Msg) { writeln(Msg); },
	);

	send(locate("worker"), 3);
	send(locate("worker"), "exit");

	try {
		receive((string What) { writeln(What); },);
	}
	catch(Throwable o) {
		writeln("caught");
	}
	Thread.sleep(dur!("seconds")(5));
}
