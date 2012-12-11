﻿package {	import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;	import flash.geom.Point;	import flash.display.Sprite;	public class BoidController extends MovieClip {		//array to hold all the boids		public var boidArray:Array = new Array();		public var backgroundArray:Array = new Array();		//width and height		public const WH:Point = new Point(800, 800);		public var pBoid:PlayerBoid;		public function BoidController() {			addEventListener(Event.ADDED_TO_STAGE, init);		}		public function init(evt:Event):void {			removeEventListener(Event.ADDED_TO_STAGE, init);			addEventListener(Event.ENTER_FRAME, update);						stage.addEventListener(MouseEvent.CLICK, playerMorph);									var obs:Obstruction;						for (var i:uint = 0; i < 20; i++){				obs = new Obstruction(this, backgroundArray);				backgroundArray.push(obs);				var scale:Number = Math.random()*.3+.2;				obs.scaleX *= scale;				obs.scaleY *= scale;				obs.alpha *= scale-.2;				obs.x = Math.random()*(WH.x);				obs.y = Math.random()*(WH.y);				addChild(obs);			}			for (i = 0; i < 10; i++){				obs = new Obstruction(this, boidArray);							boidArray.push(obs);				obs.x = Math.random()*(WH.x);				obs.y = Math.random()*(WH.y);				addChild(obs);			}						for ( i = 0; i < 100; i++) {				boidArray.push(new Bird(this));				boidArray[i].x = Math.random()*(WH.x);				boidArray[i].y = Math.random()*(WH.y);				var size:Number = Math.random()*Math.random() + .9;				boidArray[i].mass = size;				boidArray[i].scaleX = size;				boidArray[i].scaleY = size;				boidArray[i].sightRange *= size;				boidArray[i].personalSpace *= size;				addChild(boidArray[i]);			}						pBoid = new PlayerBoid(this);			addChild(pBoid);			pBoid.x = 400;			pBoid.y = 400;			boidArray.push(pBoid);														}		public function playerMorph(evt:Event):void{			pBoid.morph();		}		public function update(evt:Event):void{						for (var i:uint = 0; i < boidArray.length; i++){				boidArray[i].update();			}			for (i=0; i< backgroundArray.length; i++){				backgroundArray[i].update();			}		}	}}