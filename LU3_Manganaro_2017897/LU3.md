## The Analytical Geometry of the Plane
[App Link](https://studio.code.org/projects/applab/GqLGFKSLqW4d6yFarzzGC31aBcspnpFWGP0KhItHgRM)

### Description of the Learning Unit:
This learning unit focuses on the analytic geometry of the plane, providing students with the opportunity to graphically explore linear, circular, parabolic, and elliptical functions. 




https://studio.code.org/projects/applab/beYVDr9uKtXtTaBnmKEzlzA37-Es36MK1RjcrjZ6BjE

retta
y=2x+4

circonferenza: 
x^2 + y^2 = 4

parabola:
y = 2x^2     y=x^2+5x+23

Ellisse:
 x^2/25 + y^2/9 = 1

### [Optimal Solution](https://studio.code.org/projects/applab/GqLGFKSLqW4d6yFarzzGC31aBcspnpFWGP0KhItHgRM) (10/10) 
```javascript
    setActiveCanvas("graphic");
var width = getProperty("graphic", "width");
var height = getProperty("graphic", "height");
var arrowSize = 10;
var arrowOffset = 5;
var count=1;

var levels = {"1": "line",
              "2": "circle",
              "3": "parabola",
              "4": "ellipse"
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

function isParabolaFunction(equation) {
    var parabolaPattern = /^y\s*=\s*2\s*(\*\s*)?x\s*\^\s*2\s*$/i;
    console.log("l'equazione è " + equation);
    var formattedEquation = equation.toLowerCase().replace(/\s/g, '');

    var isParabola = parabolaPattern.test(formattedEquation);
    console.log("Is Parabola? " + isParabola);
    return isParabola;
}



function isEllipseFunction(equation) {
    var ellipsePattern = /\(x\s*\^\s*2\s*\/\s*25\)\s*\+\s*\(y\s*\^\s*2\s*\/\s*9\)\s*=\s*1/;
    var ellipsePattern2 = /\s*x\s*\^\s*2\s*\/\s*25\s*\+\s*y\s*\^\s*2\s*\/\s*9\s*=\s*1/;

    console.log("L'equazione è " + equation);
  
    var isEllisse = ellipsePattern.test(equation) || ellipsePattern2.test(equation);
    console.log("Is Ellisse? " + isEllisse);
    return isEllisse;
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


function drawParabolaFunction(equation) {
    var parabolaPattern = /^y\s*=\s*([+-]?\s*\d+(\.\d+)?\s*)?(\*?\s*x\s*\^\s*2)?\s*([+-]\s*\d+(\.\d+)?\s*\*?\s*x)?\s*([+-]\s*\d+(\.\d+)?)?\s*$/i;
    var match = equation.match(parabolaPattern);
     if (match === null) {
        console.log('Invalid equation');
    }
    var a = parseFloat(match[1] || '1');
    var b = parseFloat(match[5] || '0');
    var c = parseFloat(match[9] || '0');
    var range = 10;
    var scaleFactor = Math.min(width, height) / (2 * range);

    for (var x = -range; x <= range; x += 0.1) {
        var y = a * Math.pow(x, 2) + b * x + c;
        var plotX = width / 2 + x * scaleFactor;
        var plotY = height / 2 - y * scaleFactor;
        rect(plotX, plotY, 1, 1);
    }
}

function drawParabola(a, b, c) {
    var range = 10;
    var scaleFactor = Math.min(width, height) / (2 * range);
    for (var x = -range; x <= range; x += 0.1) {
        var y = a * Math.pow(x, 2) + b * x + c;
        var plotX = width / 2 + x * scaleFactor;
        var plotY = height / 2 - y * scaleFactor;
        rect(plotX, plotY, 1, 1);
    }
}
function drawEllipseFunction(equation) {
    var pattern = /\(x\s*\^\s*2\s*\/\s*(\d+)\)\s*\+\s*\(y\s*\^\s*2\s*\/\s*(\d+)\)\s*=\s*1/;
    var match = equation.match(pattern);
    if (match === null) {
        console.log('Invalid equation');
        return;
    }
    var a = Math.sqrt(parseFloat(match[2])); 
    var b = Math.sqrt(parseFloat(match[1])); 

    var rangeX = width / 2;
    var rangeY = height / 2;
    var scaleFactorX = rangeX / a;
    for (var y = -rangeY; y <= rangeY; y += 0.01) {
        var x = a * Math.sqrt(1 - Math.pow(y / b, 2));
        var plotX1 = width / 2 + x * scaleFactorX;
        var plotY1 = height / 2 + y;
        var plotX2 = width / 2 - x * scaleFactorX;
        var plotY2 = height / 2 + y;
        rect(plotX1, plotY1, 1, 1);
        rect(plotX2, plotY2, 1, 1);
    }
}

onEvent("equal", "click", function() {
    setActiveCanvas("graphic");
    clearCanvas();
    drawAxes();
    hideElement("alert");
    
    var funcString = getText("function1").trim();
    
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
      
            
        case "parabola":
              console.log("la funzione è"+funcString);
              if (!isParabolaFunction(funcString)) {
                showElement("alert");
                setText("alert", "Error. For level " + count + ",enter the equation of a parabola passing through the point (1,2) and having the vertex at the origin");                
                return;
            }
            drawParabolaFunction(funcString);
            break;
            
         case "ellipse":
              if (!isEllipseFunction(funcString)) {
                showElement("alert");
                setText("alert", "Error. For level " + count + ", enter the equation of an ellipse with vertices at points v1:(5, 0), v2: (-5, 0), v3:(0,3), v4:(0,-3)");
                return;
            }
            drawEllipseFunction(funcString);
            break;
        default:
            break;
    }
    
    count++;
    if (count === 5) {
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
  else if(count==3){
    setText("Funzione", "Parabola with vertex at (0,0) and passing through (1,2)");
  }
  else if(count==4){
    setText("Funzione", "Ellipse with vertices at (5,0), (-5,0), (0,3), (0,-3)");
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
            setText("alert", "Equation: " + equation+".\n Remember that you have to insert the equation of the line in the form y=mx+q in order to proceed to the next level.");
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
        setText("alert", "Equation: " + equation+"\n. Remember that you have to insert the equation of the circle with center at the origin and the radius is 2.");
    } else {
            showElement("alert");
            setText("alert", "Make sure to enter all values for a, b, and c.");
            }
  }
  else if(count==3){
    if (!isNaN(a) && !isNaN(b) && !isNaN(c)) {
      var equation = "y = " + a + "x^2 " + (b < 0 ? "-" : "+") + " " + Math.abs(b) + "x " + (c < 0 ? "-" : "+") + " " + Math.abs(c);
      console.log(equation);
      setActiveCanvas("graphic");
      clearCanvas();
      drawAxes();
  
      drawParabola(a, b, c);
      showElement("alert");
      setText("alert", "Equation: " + equation+ "\nRemember that you have to insert the equation of the parabola with the vertex at the origin and passing through the point (1,2) in order to proceed to the next level.");
    } else {
      showElement("alert");
      console.log("Make sure to enter all the values a, b and c.");
      setText("alert", "Make sure to enter all the values a, b and c.");
    }
  }
  else if(count==4){
    if(!isNaN(c)){
      showElement("alert");
      setText("alert", "You can't insert c for ellipse equation.");
    }
    else if (!isNaN(a) && !isNaN(b)) {
      var equation = "x^2/" + a*a + " - y^2/" + b*b + " = 1";
      console.log(equation);
      setActiveCanvas("graphic");
      clearCanvas();
      drawAxes();
      showElement("alert");
      setText("alert", "Equation: " + equation+ "\nRemember that you have to insert the equation of the ellipse with the vertices at points v1:(5, 0), v2: (-5, 0), v3:(0,3), v4:(0,-3) in order to proceed to the next level.");
    } else {
      showElement("alert");
      console.log("Make sure to enter all the values a, b.");
      setText("alert", "Make sure to enter all the values a, b.");
    }

  }
  
});


```

### [Sufficient Solution](https://studio.code.org/projects/applab/JaUvuyr0Ix79IB2QefUv5dcuqLiuidguU-v8u2Nzo9E)(6/10)
```javascript
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
            setText("alert", "Equation: " + equation+".\n Remember that you have to insert the equation of the line in the form y=mx+q in order to proceed to the next level.");
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
        setText("alert", "Equation: " + equation+"\n Remember that you have to insert the equation of the circle with center at the origin and the radius is 2.");
    } else {
            showElement("alert");
            setText("alert", "Make sure to enter all values for a, b, and c.");
            }
  }
 
  
});


```

