import wollok.game.*
import arbustos.*
import granjero.*
object nivel {

method configurate(){
	//	CONFIG	
	wgame.setTitle("FarmVille")
	wgame.setHeight(10)
	wgame.setWidth(10)
	wgame.setGround("ground.png")
	
//	VISUALES
 	wgame.addVisualCharacter(granjero)
	
//	ARBUSTOS
	const ancho = wgame.getWidth() - 1
	const largo = wgame.getHeight() - 1

	(1 .. ancho-1).forEach { n => new ArbustoAbajo(new Position(n, 0)) } // bordeAbajo
	(1 .. ancho-1).forEach { n => new ArbustoArriba(new Position(n, largo)) } // bordeArriba 
	(0 .. largo).forEach { n => new ArbustoIzquierda(new Position(0, n)) } // bordeIzq 
	(0 .. largo).forEach { n => new ArbustoDerecha(new Position(ancho, n)) } // bordeDer
	
//	TECLADO
	M.onPressDo { granjero.plantaMaiz() }
	T.onPressDo { granjero.plantaTrigo() }
	O.onPressDo { granjero.plantaTomaco() }
	R.onPressDo { granjero.rega() }
	C.onPressDo { granjero.cosechaTodo() }
	
	A.onPressCharacterSay { "mi oro: " + granjero.getOro() }
}

}