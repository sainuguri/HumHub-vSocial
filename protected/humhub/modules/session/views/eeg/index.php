<?php

use yii\helpers\Html;
$session = $this->context->contentContainer;
?>

<?php $this->beginContent('@humhub/modules/session/views/info/main.php') ?>
<div class="container">
	<div class="col-md-10 panel layout-content-container">
	        <script src="http://d3js.org/d3.v3.js" charset="utf-8"> </script>
<script src="http://bl.ocks.org/ndarville/raw/7075823/d3.min.js?v=3.2.8"> </script>
<script src="protected/humhub/modules/session/views/eeg/multiline.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="protected/humhub/modules/session/views/eeg/multiline.css">
      <div class="chart-wrapper" id="chart-line1"></div>
        <script type="text/javascript">
            d3.csv('protected/humhub/modules/session/views/eeg/Data.csv', function(error, data) {
              data.forEach(function (d) {
                  d.year = +d.SeqNo;
                  d.variableA = +d.Engagement;
                  d.variableB = +d.Focus;
                  d.variableC = +d.Excitement;
                  d.variableD = +d.Frustration;
                });

             var chart =makeLineChart(data, 'year', {
                 'Engagement': {column: 'variableA'},
                 'Focus': {column: 'variableB'},
                 'Excitement': {column: 'variableC'},
                 'Frustration': {column: 'variableD'}
             }, {xAxis: 'Seconds', yAxis: 'Level'});
              chart.bind("#chart-line1");
              chart.render();

        });
      </script>
      </div>
    </div>
</div>
<?php $this->endContent(); ?>
