function byId(id){
    return typeof(id) === "string"?document.getElementById(id):id;
}

// 全局变量
var index = 0;
var timer = null;

// function slideimg(){
//     var main = byId("main");
//     main.onmouseover = function(){

//     }
//     main.onmouseout = function(){
//         timer = setInterval(function(){
//             index++;
//             console.log(index);
//         },3000)
//     }
// }

// slideimg();

console.log(index);