<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<script type="text/javascript">

window.onload = function showChart(){
  var chart = new CanvasJS.Chart("chartContainer", {
  animationEnabled: true,
  title: {
    text: "Sample Pie chart"
    },
  data: [{
    type: "pie",
    startAngle: 240,
    yValueFormatString: "##0.00\"%\"",
    indexLabel: "{label} {y}",
    dataPoints: []
    }]
  });

  var labelname= '{{!label}}';
  chart.options.data[0].dataPoints.push({y: "50",label: labelname + "1" , click : onClick})
  chart.options.data[0].dataPoints.push({y: "50",label: labelname + "2" , click : onClick})

  chart.render();

  function onClick(e){
    var answer = confirm(  " Refresh for new label  :" + e.dataPoint.label + " ?" );
    if (answer == true){
      var req = new XMLHttpRequest();
      req.open('POST', '/pie', true);
      var pgid = e.dataPoint.label
      console.log('dataPOint.label is ' + pgid);
      params = 'pgid=new' + pgid;
      req.send(params);
      showChart();
      }
    else {
      }
  }
};

</script>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="static/canvasjs.min.js"></script>
</body>
</html>
