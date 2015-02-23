s.plotTree;

m = JMix(4);
m.printEfx;
m.gui;
m.close;

m.addEfx(1,2);
m.addEfx(1,0);
m.addEfx(1,1);
m.freeEfx(1,0);
m.freeEfx(1,1);
m.freeEfx(1,2);

// m.free;

(
SynthDef(\testSin, {|out, freq, amp, sustain|
	var lagFreq = Lag.kr(freq, sustain*0.5);
	Out.ar(out, LFSaw.ar([lagFreq, lagFreq+2], 0, amp))
}).add;

Pdef(\testSin,
	Pmono(\testSin, \out, m.ch(1), \group, m.synG, \amp, 1,
		\dur, 2,
		\octave, 3, \degree, Pseq([3,3,3,7], inf)
	)
).play(quant:1);
)
Pdef(\testSin).stop;