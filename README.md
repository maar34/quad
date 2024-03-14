QSG-RU 
Quad Soundscape Generator- Río Uruguay -
2009-2013, Maar (Marco) Colasso. 

## 1.INTRODUCTION 
### Quad Soundscape Generator
A realtime soundscape generator for tabletop surfaces.
Perceptual classifications of sound and environment are being used to get an holistic management of the sound by the user, being complemented with adaptative mapping techniques commanded by the logic engine. In this way we want to control the whole system away from the rational analysis used daily in the creation and manipulation of sound.

##2. SOFTWARE INSTALLATION

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


##3. USAGE

1- Open Reactivision / TuioSimulator.jar

2- Run Processing with: _01_qsgVisuales.pde

3- Run Pure Data: 0_qsgRU.pd

## 4. HARDWARE AND INTEGRATION

<iframe src="https://player.vimeo.com/video/80639025?h=4d40ed7001" width="640" height="360" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
<p><a href="https://vimeo.com/80639025">Quad : Un generador de paisajes sonoros del R&iacute;o Uruguay.</a> from <a href="https://vimeo.com/user22071445">head brothers</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
Quad is an electronic musical instrument dedicated to the generation of artificial soundscapes. It starts with field recordings taken along the Uruguay River and its surroundings.

Here you will find all the information related to its operation, the code, and plans used for its construction.

SOFTWARE
![softWeb-1024x300](https://github.com/maar34/quad/assets/862847/b6eea1a6-30ef-4c16-af5d-2d947f1de3e4)


This is a project programmed 100% based on free and multi-platform software.

The application requires three programs to run simultaneously.

1- Reactivision: It is the tracker responsible for recognizing tangible objects on the surface, sending information via OSC.

2- Gesture recognition, logic, and visual feedback are programmed in Processing. This communicates with Pure Data through OSC.

3- The application responsible for sound is programmed in Pure Data.

How can I use this application?

The procedure is quite simple,

1- First, we must download the code from GitHub.

2- Then we must open Processing and run the sketch _01_qsgVisuales.pde

2- Open Reactivision. Calibrate. If you haven't built a table, you can try with TuioSimulator.

3- Open in Pure Data Extended 0_qsgRU.pd

![hardware2](https://github.com/maar34/quad/assets/862847/11ab7da2-be90-4dc2-b747-ad97c68d79e0)

The controller consists of a low-budget multitouch table that can recognize the shape, orientation, and position of so-called tangible objects on the table.

There are two types of tangible objects:

1- The first are made of acrylic, and on the bottom, they have fiducials, which is a unique code that is recognized when placed on the surface.

2- The others are simple wooden objects, recognized as "blobs."

The table is built using a technique called diffuse backlighting, basically consisting of a cube made of wood, containing infrared LEDs inside capable of illuminating the surface as evenly as possible. A diffuser material is placed on the surface, composed of two layers of glass, a normal glass of 3 millimeters, a diffuser material, and a sandblasted glass of 4 millimeters. When an object touches the surface, it reflects more light than the diffuser and the objects in its background. The light is reflected and detected by a camera with an infrared filter, so it is capable of capturing only infrared light, finally, the information is digitized to be analyzed by a tracker (Reactivision).
![funcionamiento-09-1024x576](https://github.com/maar34/quad/assets/862847/190b1542-75e2-4b69-9da4-94edf0e3d0de)

For more information regarding the construction of this type of device, you can visit the NUI-Group forums and download the package of files that gathers the most relevant information for the construction of this table.

## 5.REFERENCES

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


