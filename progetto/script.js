/*function evidenzia(nome){
	
	
	
}

function disevidenzia(nome){
	
	
	
addEventListener("mouseleave",disevidenzia(divImmagine[i].childNodes[1].childNodes[j].id))
}*/

function gestoreLoad(){
	try{
		divImmagine=document.getElementsByClassName("immagine retro");
		for (var i=0; i<2; i++){
			//aggiungo eventi onmouseenter e onmouseleave alle aree
			for (var j=0; j<divImmagine[i].childNodes[1].childNodes.length; j++){
				divImmagine[i].childNodes[1].childNodes[j].addEventListener("mouseenter",function(){
					console.log(this.id+" entrata");
					evidenziazione=document.getElementsByClassName(this.id);
					for (var i=0; i<evidenziazione.length; i++){
						evidenziazione[i].style.color="yellow";
					}
				});
				divImmagine[i].childNodes[1].childNodes[j].addEventListener("mouseleave",function(){
					evidenziazione=document.getElementsByClassName(this.id);
					for (var i=0; i<evidenziazione.length; i++){
						evidenziazione[i].style.color="black";
					}
				});
			}
		}
	}
	catch(e){
		alert("gestoreLoad "+e);
	}
}

window.onload=gestoreLoad;