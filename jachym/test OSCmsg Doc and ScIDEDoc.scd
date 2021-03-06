// SC 3.7.0alpha win (build SuperCollider-3.7alpha0-win32-2014.03.16.exe)

(
var net;
var userA,userB;
var recA,recB;

userA = Document.new("userA","");
userB = Document.new("userB","");
net = NetAddr("127.0.0.1", NetAddr.langPort;);

userA.textChangedAction = { arg ...args;
	var position = args[1];
	var removeNum = args[2];
	var string = args[3];
	var userName = "userA";
	net.sendMsg('/livecodeAB',userName,string,position,removeNum); //nove oznaceni headeru pro kazdy smer
	("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position ++ " || " ++ removeNum).postln;
};

userB.textChangedAction = { arg ...args;
	var position = args[1];
	var removeNum = args[2];
	var string = args[3];
	var userName = "userB";
	net.sendMsg('/livecodeBA',userName,string,position,removeNum); //nove oznaceni headeru pro kazdy smer
	("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position ++ " || " ++ removeNum).postln;
};

recA = OSCFunc({|msg, time, addr, recvPort|
	var timestamp = time;
	var sender = msg[1].asString;
	var string = msg[2].asString;
	var position = msg[3].asInt;
	var removeNum = msg[4].asInt;

	("MSG : " ++ msg).postln;
	("TIME : " ++ time).postln;
	("ADDR : " ++ addr).postln;
	("RECVPORT : " ++ recvPort).postln;

	("RecivedMsg from " ++ sender ++ " || " ++ string ++ " || " ++ position ++ " || " ++ removeNum).postln;
	userA.string_(string,position,removeNum);
}, '/livecodeBA', net);

recB = OSCFunc({|msg, time, addr, recvPort|
	var timestamp = time;
	var sender = msg[1].asString;
	var string = msg[2].asString;
	var position = msg[3].asInt;
	var removeNum = msg[4].asInt;

	("MSG : " ++ msg).postln;
	("TIME : " ++ time).postln;
	("ADDR : " ++ addr).postln;
	("RECVPORT : " ++ recvPort).postln;

	("RecivedMsg from " ++ sender ++ " || " ++ string ++ " || " ++ position ++ " || " ++ removeNum).postln;
	userB.string_(string,position,removeNum);
}, '/livecodeAB', net);
)

