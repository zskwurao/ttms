//var ul1=document.getElementsByClassName('ul1');
//var oLi=ul1.getElementsByTagName('li');
//var oA = document.getElementById('a1');

//for(var i=0;i<oLi.length;i++){
//	oLi[i].onmouseover=function(){
//		oA.src = 'http://s8.qhimg.com/share/audio/piano1/'+this.getAttribute('au')+'4.mp3';
//			
//		oA.play();
//
//	}
//}


var ul=document.getElementById('ul');
var li=ul.getElementsByTagName('li');
var img=document.getElementsByTagName('img');
var time=null;
var arr=[];
console.log(li.length)
for(var i=0;i<li.length;i++){
	arr.push([getStyle(li[i],'left'),getStyle(li[i],'top'),getStyle(li[i],'opacity'),getStyle(li[i],'z-index')]);
	
};
time=setInterval(function(){
	arr.push(arr[0]);
	arr.shift();
	for(var i=0;i<li.length;i++){
		li[i].style.zIndex=arr[i][3];
		li[i].style.left=arr[i][0];
		li[i].style.top=arr[i][1];
		li[i].style.opacity=arr[i][2];
	}
},1000);
//for(var i=0;i<li.length;i++){
//	(function(i){
//		img[i].onmousemove=function(){
//			this.style.transaction="transform: scale(1.5, 1.5) .3s"
//		}
//	})(i)
//}
ul.onmousemove=function(){
	clearInterval(time);
}
ul.onmouseout=function(){
	time=setInterval(function(){
	arr.push(arr[0]);
	arr.shift();
	for(var i=0;i<li.length;i++){
		li[i].style.zIndex=arr[i][3];
		li[i].style.left=arr[i][0];
		li[i].style.top=arr[i][1];
		li[i].style.opacity=arr[i][2];
//		li.style.transition=
	}
},1000);
}
//console.log(arr);
function getStyle(obj,attr){
	if(obj.currentStyle){
		return obj.currentStyle[attr];
	}
	else{
		return getComputedStyle(obj,false)[attr];
	}
}
