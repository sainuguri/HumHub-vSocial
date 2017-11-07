<?php

use yii\helpers\Html;
use humhub\modules\space\models\Space;
use humhub\modules\admin\widgets\SpaceGridView;
?>

<script src="http://d3js.org/d3.v3.js" charset="utf-8"> </script>
<h4><?= Yii::t('AdminModule.views_space_index', 'Network Information'); ?></h4>
<div class="help-block">
    <?= Yii::t('AdminModule.views_space_index', 'This overview contains a list of each space with actions to view, edit and delete spaces.'); ?>
</div>

<div class="table-responsive">
<div class="panel panel-body" >
    <script type="text/javascript">
      var w = 500;
      var h = 300;
      function buildLineCSV(){
        var line = d3.svg.line()
                      .x(function (d){return d.framerate;})
                      .y(function (d){return d.simrate;})
                      .interpolate("linear")

        var svg = d3.select(".panel-body").append("svg").attr({width:w,height:h});

        svg.append("path")
        .attr({
            d:line(ds),
            "stroke":"purple",
            "stroke-width":2,
            "fill":"none"
        })

        
      }
        d3.csv('protected/humhub/modules/admin/data/network/hifi.csv', function(error, data) {

          if(error){
            console.log(error);
          }else{
            console.log(data);
            ds = data;
          }
          buildLineCSV();
        });
</script>
</div>   
</div>
