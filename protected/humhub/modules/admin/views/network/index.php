<?php

use yii\helpers\Html;
use humhub\modules\space\models\Space;
use humhub\modules\admin\widgets\SpaceGridView;
?>
<style type="text/css">

/* Style the dots by assigning a fill and stroke */

.line {
  stroke-width: 2px;
}
.dot {
    fill: #ffab00;
    stroke: #fff;
}

</style>
<script src="http://d3js.org/d3.v3.js" charset="utf-8"> </script>
<!-- <h4><?= Yii::t('AdminModule.views_space_index', 'Network Information'); ?></h4> -->
<div class="help-block">
    <?= Yii::t('AdminModule.views_network_index', 'This overview contains the network information'); ?>
</div>

<div class="table-responsive">
<div class="panel panel-body" >
    <script type="text/javascript">
      d3.csv('protected/humhub/modules/admin/data/network/hifi.csv', function(error, data) {


          var margin = {top: 20, right: 20, bottom: 30, left: 50};
          var width = 960 - margin.left - margin.right;
          var height = 600 - margin.top - margin.bottom;
          var parseDate = d3.time.format("%m/%d/%Y %H:%M:%S").parse;

          var x = d3.time.scale()
                    .range([0, width]);

          var y = d3.scale.linear()
                    .range([height, 0]);

          var xAxis = d3.svg.axis()
                        .scale(x)
                        .orient("bottom")
                        .tickFormat(d3.time.format("%m/%d/%Y %H:%M:%S"));

          var yAxis = d3.svg.axis()
                        .scale(y)
                        .orient("left");

          var line = d3.svg.line()
                        .x(function(d) { return x(d.date); })
                        .y(function(d) { return y(d.framerate); });

          var svg = d3.select(".panel-body").append("svg")
                      .attr("width", width + margin.left + margin.right)
                      .attr("height", height + margin.top + margin.bottom)
                      .append("g")
                      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
                      .style({ 'stroke': 'blue', 'fill': 'none', 'stroke-width': '1px'});;

          data.forEach(function(d) {
              d.date = parseDate(d.date);
              console.log(d.date);
              d.framerate = +d.framerate;
          });

          x.domain(d3.extent(data, function(d) { return d.date; }));
          y.domain(d3.extent(data, function(d) { return d.framerate;}));

          svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis)
              .selectAll("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 0)
                .attr("x", -10)
                .attr("dy", ".45em")
                .style("text-anchor", "end");

          svg.append("g")
                .attr("class", "y axis")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", ".71em")
                .style("text-anchor", "end")
                .text("Frame Rate");

          svg.append("path")
                .datum(data)
                .attr("class", "line")
                .attr("d", line);



          svg.selectAll(".dot")  
              .data(data)     
          .enter().append("circle")               
              .attr("r", 5)   
              .attr("cx", function(d) { return x(d.date); })     
              .attr("cy", function(d) { return y(d.framerate); });
      });
</script>
</div>   
</div>
