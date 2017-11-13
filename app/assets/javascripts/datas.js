var yBreakPoint = 550;
var xBreakPoint = 300;


var Chart = (function(window,d3) {
    //console.log('Hello World!')

  var data = <%=raw @mydata %>;
  var dataSps = <%=raw @mysps.to_i %>;
  console.log(dataSps);
  var svg, x, y, xAxis, yAxis, dim, chartWrapper, line, path, margin = {}, width, height;
  //console.log(data.length);
  
  var finalTick = dataSps - ((data.length-1) % dataSps) + dataSps/2;
  //console.log(fullest);

 var timeStamp = [];
  for (var i = 0; i < data.length + finalTick; i++) {
    timeStamp.push(i/dataSps);
  }
  //console.log(timestamp);
  


  init(data, timeStamp);
  //called once the data is loaded
  //(start)
  function init(data, timeStamp) {
    //console.log('Hello World!');
    //console.log(timestamp.length);

    //initialize scales
    xExtent = d3.extent(timeStamp, function(d,i) { return d });
    //console.log(xExtent);
    yExtent = d3.extent(data, function(d,i) { return d });
    //console.log(yExtent);

    //
   
    //
    
    x = d3.scale.linear().domain(xExtent);
    y = d3.scale.linear().domain(yExtent);
    //console.log(x);

    //initialize axis
    xAxis = d3.svg.axis().orient('bottom');
    yAxis = d3.svg.axis().orient('left');

    //the path generator for the line chart
    line = d3.svg.line()
      .x(function(d,i) { return x(timeStamp[i]) })
      .y(function(d,i) { return y(data[i]) });
    //initialize svg
    svg = d3.select('#chart').append('svg').classed('chart-area', true);
    chartWrapper = svg.append('g');
    path = chartWrapper.append('path').datum(data).classed('line', true);
    chartWrapper.append('g').classed('x axis', true);
    chartWrapper.append('g').classed('y axis', true);

    //render the chart
    render();
  }
//(end)

//(start)
  function render() {

    //get dimensions based on window size
    updateDimensions(window.innerWidth * 0.9);
    
    //update x and y scales to new dimensions
    x.range([0, width]);
    y.range([height*0.5, 0]);

    //update svg elements to new dimensions
    svg
      .attr('width', width + margin.right + margin.left)
      .attr('height', height * 0.5 + margin.top + margin.bottom);
    chartWrapper.attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

    //update the axis and line
    xAxis.scale(x);
    yAxis.scale(y);//.orient(window.innerWidth < breakPoint ? 'right' : 'left');

    if(window.innerWidth < xBreakPoint) {
       xAxis.ticks(5)
    }
    else {
      xAxis.ticks(11)
    }

    if(window.innerWidth < yBreakPoint) {
       yAxis.ticks(4)
    }
    else {
      yAxis.ticks(9)
    }

    
    svg.select('.x.axis')
      .attr('transform', 'translate(0,' + height * 0.5 + ')')
      .call(xAxis);

    svg.select('.y.axis')
      .call(yAxis);


    //var ticks = d3.selectAll(".tick text");

      //ticks.attr("class", function(d,i){
       //if(i%2 != 0) d3.select(this).remove();
      //});

    path.attr('d', line);
  }
//(end)

//(start)
  function updateDimensions(winWidth) {
    console.log(winWidth);
    margin.top = 20;
    margin.right = 20;//winWidth < breakPoint ? 0 : 50;
    margin.left = 50;//winWidth < breakPoint ? 0 : 50;
    margin.bottom = 50;

    width = (winWidth - margin.left - margin.right);
    height = .7 * width; //aspect ratio is 0.7
  }

  return {
    render : render
  }
//(end)

})(window,d3);

window.addEventListener('resize', Chart.render);