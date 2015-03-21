s.scope(8);
////HIGH FREQUENCY

(
Ndef(\1).fadeTime=2;
Ndef(\l, {

	~m=Line.kr(0,1,180);    ////volume ramp

	~s=HPF.ar(WhiteNoise.ar(1),10000);
	~s=~s*Decay2.kr(Impulse.kr([0.5,0.25]),decayTime:0.051);
	~s=FreeVerb.ar(~s,mix:0.5,room:2,damp:0,mul:~m);  ////mul
}).play;
)
Ndef(\l).stop;

////

(
Pdef(\ting,
	Pbind(
		\instrument, \ting,
		\dur, Pseq([0.12,Rest(0.2)],inf),
		\freq,14000,
		\pan, Prand([-1,1],inf),
		\legato, 0.5,
		\amp, 0.2,
)).play(quant:2);
)
Pdef(\ting).stop;

(
Pdef(\ting2,
	Pbind(
		\instrument, \ting,
		\dur,
		Prand([0.2,0.12,0.4,0.12,Rest(0.2),0.1,0.2,0.2,Rest(0.1),Rest(0.2),Rest(0.4)],inf),
		\freq,16000,
		\pan, Prand([-1,1],inf),
		\legato, 0.5,
		\amp, 0.01,
)).play(quant:2);
)
Pdef(\ting2).stop;

//////////////////////////////////////////////////////////////////////////

////BEATS

(
Pdef( \bum1,
	Pbind(
		\instrument, \bum,
		\dur, 2,
		\freq,45,
		\legato, Pseq([0.9,0.6],inf),
		\amp, 0.7
)).play(quant:2);
)
Pdef( \bum1).stop;

//these two together

(
Pdef( \bum2,
	Pbind(
		\instrument, \bum,
		\dur, 0.5,
		\freq,48,
		\legato, Pseq([
			Pseq([0.8,0.2],2),
			Pseq([0.8,0.4],1),
			Pseq([0.8,0.8],1),
			Pseq([0.8,1],2),
			Pseq([0.8,1.2],6),
			Pseq([0.8,1.4],4),
			Pseq([0.8,0.4],1),
		],inf),
		\amp, 0.7
)).play(quant:2);
)
Pdef( \bum2).stop;

(
Pdef(\bum3,
	Pbind(
		\instrument, \bum,
		\dur, Pseq([0.5,0.2,0.5,Rest(0.25)],inf),
		\freq,Pseq([Pn(45,16), Pn(65,8)],inf),
		\amp,0.4,
		\legato,Pseq([0.8,0.6],inf),
)).play(quant:2);
)
Pdef(\bum3).stop;


////high beat very fast
(
Pdef(\ting,
	Pbind(
		\instrument, \ting,
		\dur, Pseq([0.12,Rest(0.2)],inf),
		\freq,14000,
		\pan, Prand([-1,1],inf),
		\legato, 0.4
)).play(quant:2);
)
Pdef(\ting).stop;

////roar

(
Pdef(\roar,
	Pbind(
		\instrument, \dribble,
		\dur, 2,                    /////attention to arg in synth
		\freq,40,
		\f2, 0.5,
		\legato, 0.6,
		\lag, 0.0008,
)).play(quant:2);
)

Pdef(\roar).stop;

//////RIPPLE

(
Pdef(\loprip1,
	Pbind(
		\instrument, \ripple,
		\dur, 2,
		\freq,Pseq([700,Pn(400,2),300],inf),
		\amp, 0.2,
		\legato,0.8,
		\f2,1,
)).play(quant:2);
)
Pdef(\lopup1).stop;

////////////////////////////////////////////////////////////////////////////////////////

///////CONTEMPLATIVE

(
Pdef(\loppzum,
	Pbind(
		\instrument, \zum,
		\dur, Pseq([2,2,3,1,2,1],inf),
		\note, [7,1,3,5],
		\strum, 0.2,
		\octave, Pseq([[8,6],[7,5],[4,7],[6,8,5],[7,4,8],[3,4,8]],inf),
		\legato, 2,
		\lag, 0.02,
		\amp,0.01,

)).play(quant:2);
)
Pdef(\loppzum).stop;

(
Pdef(\sin3,
	Pbind(
		\instrument, \sin,
		\dur,4,
		\octave, Pseq([3,4,5,3,6,7],inf),
		\note, [1,5,7,9],
		\strum,0.45,
		\amp, 0.02,
		\legato,2,
)).play;
)

(
Pdef(\loptic1,
	Pbind(
		\instrument, \tictum,
		\dur, Pseq([2,Rest(1)],inf),
		\freq, Pseq([Pn(4000,4),Pn(500,2)],inf),  //////
		\amp, 0.5,
		\legato, 1,
)).play(quant:2);
)

//////HAT WITH ECHO
(
Pdef( \lopwoosh,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([0.5,Rest(1)],inf),
		\freq,10000,
		\legato, 2,
		\f2, Pseq([Pseries(2,4,5),Pseries(10,-2,3)],inf),  ///rythmical
		\amp, 1
)).play(quant:2);
)
Pdef( \lopwoosh).stop;

(
Pdef( \lopwoosh1,
	Pbind(
		\instrument, \woosh,
		\dur, Pseq([0.3,0.15,Rest(0.55)],inf),       //very simple
		\freq,12000,
		\legato, 0.3,
		\amp, 2,
		\f2, 1,
)).play(quant:2);
)
Pdef( \lopwoosh1).stop;



////////HAPPY CREEPY TIU TIU
(
Pdef(\lopbummhi3,
	Pbind(
		\instrument, \bum,
		\dur, 2,
		\octave, Pseq([7,6,5,7.4,5],inf),  ///LOW AMP!
		\note, [8,6,4,4,4,8,2],
		\strum, 0.75,
		\amp, 0.01,
		\legato, 0.3,
)).play(quant:2);
)
Pdef(\lopbummhi3).stop;




//////////DRONE

(
Pdef(\dfm1,
	Pbind(
		\instrument, \dfm,
		\dur, 4,
		\strum, 1,
		\octave, Prand([[4,3],[5,2],[4,3],[4,4]],inf),
		\notes, Prand([[1,5,7],[6,4,8],Prand([[2,5],[1,3],[2,4]],2)],inf),
		\legato,2,
		\lag, 0.002,
		\res, Prand([1,0.5,1.2,1.4,0.2],inf),
		\amp, 0.4,   //not bigger than 0.5
)).play(quant:2);
);

Pdef(\dfm1).stop;



///////////////////PIANO
(
Pdef(\piano,
	Pbind(
		\instrument, \piano1,
		\octave, Pseq([3,3,4,2,3,6,5,2],inf),
		\note, [1,5,7,1,3],
		\dur,2,
		\strum, 0.75,
		\amp, 1,
)).play;
)
Pdef(\piano).stop;


(
Pdef(\piano2,
	Pbind(
		\instrument, \piano1,
		\octave, Pseq([6,7,4,5,6,5, Pn(6,2), Pn(4,2),Pn(2,2)],inf),
		\note, [1,3,7,5,3,7],
		\dur,2,
		\strum, 0.75,
		\amp, 0.1,
)).play;
)
Pdef(\piano2).stop;

/////////////////











