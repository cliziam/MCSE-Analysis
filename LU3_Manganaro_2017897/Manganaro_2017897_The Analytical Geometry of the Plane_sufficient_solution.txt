setActiveCanvas("graphic");
var width = getProperty("graphic", "width");
var height = getProperty("graphic", "height");
var arrowSize = 10;
var arrowOffset = 5;
var count=1;

var levels = {"1": "line",
              "2": "circle"
};

setScreen("SpiegazioneLivello");

onEvent("ok", "click", function( ) {
  clearCanvas();
  drawAxes();
  hideElement("alert");
  setText("LevelN", count);
  setScreen("Homepage");
  setText("function1", "");
  console.log(count);

});



function drawAxes() {
    line(0, height / 2, width, height / 2); 
    line(width / 2, 0, width / 2, height);
    line(width - arrowOffset, height / 2 - arrowSize / 2, width, height / 2); 
    line(width - arrowOffset, height / 2 + arrowSize / 2, width, height / 2); 
    line(width / 2 - arrowSize / 2, arrowOffset, width / 2, 0); 
    line(width / 2 + arrowSize / 2, arrowOffset, width / 2, 0); 
}
drawAxes();
function isLinearFunction(equation) {
    var linePattern = /^\s*(y\s*=\s*[+-]?\s*\d*\s*\*\s*x\s*[+-]?\s*\d+|x\s*=\s*[+-]?\s*\d+|y\s*=\s*[+-]?\s*\d*\s*\*\s*x|y\s*=[+-]?\s*\d*\s*\+\s*\d*\s*\*\s*x|y\s*=[+-]?\s*\d*\s*\+\s*x|y\s*=\s*x\s*[+-]?\s*\d+)\s*$/;
    var linePattern2 = /^\s*(y\s*=\s*[+-]?\s*\d*\s*\*\s*x\s*[+-]?\s*\d+|x\s*=\s*[+-]?\s*\d+|y\s*=\s*[+-]?\s*\d*\s*\*\s*x|y\s*=[+-]?\s*\d*\s*\+\s*\d*\s*\*\s*x|y\s*=[+-]?\s*\d*\s*\+\s*x|y\s*=\s*x)\s*$/;
    var linePattern3= /^\s*(y\s*=\s*[+-]?\s*\d+(\.\d+)?\s*\*\s*x\s*[+-]?\s*\d+(\.\d+)?|x\s*=\s*[+-]?\s*\d+(\.\d+)?|y\s*=\s*[+-]?\s*\d+(\.\d+)?\s*\*\s*x|y\s*=[+-]?\s*\d+(\.\d+)?\s*\+\s*\d+(\.\d+)?\s*\*\s*x|y\s*=[+-]?\s*\d+(\.\d+)?\s*\+\s*x|y\s*=\s*x\s*[+-]?\s*\d+(\.\d+)?)\s*$/;
    var linePattern4 = /^\s*(y\s*=\s*[+-]?\s*\d+x\s*[+-]?\s*\d+|x\s*=\s*[+-]?\s*\d+|y\s*=\s*[+-]?\s*\d+x|y\s*=[+-]?\s*\d+\s*\+\s*\d+x|y\s*=[+-]?\s*\d+\s*\+\s*x|y\s*=\s*x)\s*$/;
    var linePattern5 = /^\s*(y\s*=\s*-x)\s*$/;
    var linePattern6 = /^\s*(y\s*=\s*-x\s*[+-]\s*\d+)\s*$/;

    if (linePattern.test(equation) || linePattern2.test(equation) || linePattern3.test(equation) || linePattern4.test(equation) || linePattern5.test(equation) || linePattern6.test(equation)) {
        return true;
    } else {
        return false;
    }
}
function isCircleFunction(equation) {
    equation = equation.replace(/\s/g, '');
    // Controlla se l'equazione è  x^2+y^2=4, y^2+x^2=4, x^2+y^2-4=0 o y^2+x^2-4=0
    var pattern = /^(x\^2\+y\^2=4)$|^(y\^2\+x\^2=4)$|^(x\^2\+y\^2-4=0)$|^(y\^2\+x\^2-4=0)$/;
    return pattern.test(equation);
}






function drawLinearFunction(equation) {
    equation = equation.replace(/(\d)([a-zA-Z])/g, "$1 * $2");
    var f;
    try {
        console.log("La funzione inserita è: " + equation);
        f = Function("x", "return " + equation + ";");
    } catch (error) {
        console.log("Errore durante la creazione della funzione: " + error.message);
        return;
    }

    for (var i = 0; i < width; i++) {
        rect(i, height / 2 - f((i - width / 2) / 10) * 10, 1, 1);
    }
}
function drawCircleFunction(equation, originX, originY) {
    var radius = parseFloat(equation.match(/\d+(\.\d+)?/)[0]); 

    var centerX = originX;
    var centerY = originY;

    var step = Math.PI / 180; 

    // serve per ingrandire il cerchio
    var scaleFactor = 20; 
      
    for (var angle = 0; angle <= 2 * Math.PI; angle += step) {
        var x = centerX + radius * Math.cos(angle) * scaleFactor;
        var y = centerY + radius * Math.sin(angle) * scaleFactor;
        rect(x, y, 1, 1);
    }
}
function drawCircle(a, b, c) {
    var h = -a / 2;
    var k = -b / 2;
    var radius = Math.sqrt(h*h + k*k - c);

    var centerX = width / 2 + h;
    var centerY = height / 2 - k; 
    var step = Math.PI / 180; 
    var scaleFactor = 20; 
      
    for (var angle = 0; angle <= 2 * Math.PI; angle += step) {
        var x = centerX + radius * Math.cos(angle) * scaleFactor;
        var y = centerY + radius * Math.sin(angle) * scaleFactor;
        rect(x, y, 1, 1);
    }
}



onEvent("equal", "click", function() {
    setActiveCanvas("graphic");
    clearCanvas();
    drawAxes();
    hideElement("alert");
    
    var funcString = getText("function1").trim();
    funcString = funcString.toLowerCase();
    console.log(funcString);
    var functionType = levels[count];
    if (!functionType) {
        console.log("Livello non valido!");
        return;
    }
    switch (functionType) {
        case "line":
            if (!isLinearFunction(funcString)) {
                showElement("alert");
                setText("alert", "Error. For level " + count + ", enter the equation of a line in the form y=.");
                return;
            }
            drawLinearFunction(funcString);
            break;
        
        case "circle":
            if (!isCircleFunction(funcString)) {
                showElement("alert");
                setText("alert", "Error. For level " + count + ", enter the equation of a circle with center at the origin of the axes.");
                return;
            }
            drawCircleFunction(funcString,width/2,height / 2 );
            break;
      
        default:
            break;
    }
    
    count++;
    if (count === 3) {
              showElement("final");
              return; 
            }
    else{
      showElement("next");
    }
});


onEvent("next", "click", function( ) {
  hideElement("next");
  setScreen("SpiegazioneLivello");
  setText("Livello", count);
  
  if(count==1){
    setText("Funzione", "Line in explicit form (with values)");
  }
  else if(count==2){
    setText("Funzione", "Circle with r=2 and center at (0,0)");
  }

});


onEvent("draw", "click", function( ) {
    var a = parseFloat(getText("a").trim());
    var b = parseFloat(getText("b").trim());
    var c = parseFloat(getText("c").trim());
    a = a.toFixed(2);
    b = b.toFixed(2);
    c = c.toFixed(2);
   if (count === 1) {
        if (!isNaN(a) && !isNaN(b) && !isNaN(c)) {
            var m=(-a / b);
            m=m.toFixed(2);
            var q=(-c / b);
            q=q.toFixed(2);
            var equation = "y=" + m + "x+" +q;
            setActiveCanvas("graphic");
            clearCanvas();
            drawAxes();
            drawLinearFunction(equation);
            showElement("alert");
            setText("alert", "Equation: " + equation+".\n Remember that you have to insert the equation of the line in the form y=mx+q in order to proceed to the next level. (on the left side)");
        } else {
            showElement("alert");
            setText("alert", "Make sure to enter all values for a, b, and c.");
        }
  }
  else if(count==2){

      if (!isNaN(a) && !isNaN(b) && !isNaN(c)) {
        var h = -a / 2;
        var k = -b / 2;
        var r = Math.sqrt(Math.abs(c-(Math.pow(a, 2)+ Math.pow(b, 2))/4));
        r = r.toFixed(2);
        console.log(r);
        var equation = "(x" + (h < 0 ? "-" : "+") + " " + Math.abs(h) + ")^2+(y" + (k < 0 ? "-" : "+") + " " + Math.abs(k) + ")^2=" + r + "^2.";
        console.log(equation);
        setActiveCanvas("graphic");
        clearCanvas();
        drawAxes();

        drawCircle(a, b, c);
        showElement("alert");
        setText("alert", "Equation: " + equation+"\n Remember that you have to insert the equation of the circle with center at the origin and the radius=2.");
    } else {
            showElement("alert");
            setText("alert", "Make sure to enter all values for a, b, and c.");
            }
        }
});

