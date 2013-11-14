QSG-RU 
Quad Soundscape Generator- Río Uruguay -
2013, Marco Colasso. 
marco.colasso (a) gmail.com

----------------------------------------------------------------------------

Quad Soundscape Generator
A realtime soundscape generator for tabletop surfaces.
Perceptual classifications of sound and environment are being used to get an holistic management of the sound by the user, being complemented with adaptative mapping techniques commanded by the logic engine. In this way we want to control the whole system away from the rational analysis used daily in the creation and manipulation of sound.

----------------------------------------------------------------------------
2. INSTALLATION

This Application is Cross-platform. 
In order to run this code, you need 3 programs and some externals. 

Tracker. 

Use Reactivision or a TUIO compatible software to track fiducials and objects. 

http://reactivision.sourceforge.net/
http://www.tuio.org/?software

Logic + Visuals

Use processing version 1.2.1 or 1.5.1, I haven´t ported to version 2.0 yet. 
https://code.google.com/p/processing/downloads/list?can=1&q=

Libraries:
oscP5/netP5

http://www.sojamo.de/libraries/oscP5/

mesh
http://www.leebyron.com/else/mesh/

TUIO
http://www.tuio.org/?processing

Pure Data 

Instal Pure Data Extended. 

http://puredata.info/downloads/pd-extended

Load  Included Externals.
  
Download and Import Soundhack Library
+pitchdelay~
+bubbler~
Freeware from SoundHack
http://www.soundhack.com/freeware/


----------------------------------------------------------------------------
3. USAGE

1- Open Reactivision / TuioSimulator.jar

2- Run Processing with: _01_qsgVisuales.pde

3- Run Pure Data: 0_qsgRU.pd

----------------------------------------------------------------------------


REFERENCES

These are the main References used for this work. 

- Code

STEREO, MULTICHANNEL AND BINAURAL SOUND SPATIALIZATION
in Pure-Data - 2007, Georg Holzmann
grh _at_ mur _dot_ at
http://grh.mur.at/publications/sound-spatialization-pd

Andy Farnell - PD- Examples

http://aspress.co.uk/sd/

Pure Data examples/help

- Book+Papers

	 FARNELL Andy. Designing Sound. Applied Scientific Press, London, England
,2008, 650p.
	HUNT Andy, KIRK Ross, Mapping Strategies for Musical Performance, University of York, U.K., 2000.
	SCHAEFFER  R. Pierre. Solfege de L'Object Sonore  Audio CD y Texto. 1998. 176p.
	SCHAFER R. Murray. The Tunning of the World. Random House Inc, 1st edition, June 1977, 301p.
	TRUAX Barry, Handbook for acoustic ecology [en linea] Second Edition, Simon Fraser University, and ARC Publications. 1999 Disponible en http://www.sfu.ca/sonic-studio/handbook/ 
	PATTEN James, RETCH Ben, ISHII Hiroshi, Audiopad, a tag based interface for musical performance.  Tangible Media Group, MIT
	JORDÀ Sergi, GEIGER Günter, ALONSO Marcos, KALTENBRUNNER Martin. The reacTable: Exploring the Synergy between Live 
	 REAS Casey, FRY Ben, Processing: a programming handbook for visual designers and artists, The MIT Press Cambridge, Massachusetts London, England, 2007. 736p
 	PURE DATA Portal. puredata.info/ 
 	Santiago Atmosférico, Pd Patch [En linea], 2006. http://www.mcolasso.com/?p=11
	CHADABE Joel, The Limitations of Mapping as a Structural Descriptive in Electronic Instruments. NIME proceedings, Dublin, Irlanda. 2002


Feedback

Please report bugs and feature requests to:

Marco Colasso
mcolasso.com 
marco.colasso (a) gmail.com 
