

// flute synth ///////////////////////////////////////

(
~flute.ar(2);
~flute.quant=2;
~flute.fadeTime=4;
~flute={
  var speed = 1/8/[1,2,4] * ~tempo;
  var oct = TWChoose.kr(Impulse.kr(speed/4),[0,-1,2,1]*12,[1,0.2,0.1,0.5],1);
  var f = TWChoose.kr(Impulse.kr(speed/8),[60,64,67,65,71]+oct,[1,1,1,0.2,0.1],1).midicps/2;
  //var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = VarSaw.ar([f,4.41/f,speed/40],0,LFDNoise1.kr(speed!3))*14.41;//*f/30;
  sig = CombN.ar(sig,1/f,8/f,1)/8+sig;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Resonz.ar(sig,f,SinOsc.kr(1/40/[1,2,3]).range(0.001,0.04)) * VarSaw.ar(f+SinOsc.kr(1/f/[1,2,3],mul:pi),(sig.distort*pi),LFDNoise1.kr(speed/2!3));
  sig = Normalizer.ar(sig) * (LFTri.ar(speed/[1,2,3]/4) ** 4 * [1,0.66,0.33]);
  sig = LeakDC.ar(sig);
  sig = Vibrato.ar(sig,[5,6,7],0.02);
  //sig = LPF.ar(sig,f*4);
  sig = CompanderD.ar(sig,1,1/2);
  Splay.ar(sig,0.35,0.05);
};
~flute.play;
~flute[1] = \filter -> {|sig| DWGReverb.ar(HPF.ar(LPF.ar(sig,3500),150),[4020,4000],1/2)};
);
~flute.stop(4);
~flute.clear;
~flute.pause;
~flute.resume;


(
{
  p.stop(10);
  ~master.play;
  10.wait;
  p.clean;
}.fork;  
)

