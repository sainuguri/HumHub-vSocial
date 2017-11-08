var data = [{
            "creat_time": "2013-03-12 15:09:04",
            "record_status": "ok",
            "roundTripTime": "16"
        }, {
            "creat_time": "2013-03-12 14:59:06",
            "record_status": "ok",
            "roundTripTime": "0"
        }, {
            "creat_time": "2013-03-12 14:49:04",
            "record_status": "ok",
            "roundTripTime": "297"
        }, {
            "creat_time": "2013-03-12 14:39:06",
            "record_status": "ok",
            "roundTripTime": "31"
        },{
            "creat_time": "2013-03-12 14:29:03",
            "record_status": "ok",
            "roundTripTime": "0"
    }];
    var margin = {top: 20, right: 20, bottom: 30, left: 50};
    var width = 960 - margin.left - margin.right;
    var height = 500 - margin.top - margin.bottom;
    var parseDate = d3.time.format("%Y-%m-%d %H:%M:%S").parse;
    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .tickFormat(d3.time.format("%Y-%m-%d %H:%M"));;

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var line = d3.svg.line()
        .x(function(d) { return x(d.creat_time); })
        .y(function(d) { return y(d.roundTripTime); });


    var svg = d3.select(".panel-body").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    data.forEach(function(d) {
        d.creat_time = parseDate(d.creat_time);
        d.roundTripTime = +d.roundTripTime;
    });

    x.domain(d3.extent(data, function(d) { return d.creat_time; }));
    y.domain(d3.extent(data, function(d) { return d.roundTripTime;}));

    svg.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0," + height + ")")
          .call(xAxis);

    svg.append("g")
          .attr("class", "y axis")
          .call(yAxis)
          .append("text")
          .attr("transform", "rotate(-90)")
          .attr("y", 6)
          .attr("dy", ".71em")
          .style("text-anchor", "end")
          .text("return time(ms)");

    svg.append("path")
          .datum(data)
          .attr("class", "line")
          .attr("d", line);