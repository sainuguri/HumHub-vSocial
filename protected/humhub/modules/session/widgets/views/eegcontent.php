<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */

use yii\helpers\Url;
use yii\helpers\Html;
use \humhub\compat\CHtml;
use yii\widgets\ActiveForm;
use humhub\modules\space\models\Space;

?>


<div class="col-md-12 table-responsive">
    <table class="table table-hover">
        <thead style="border: none">
            <tr>
                <th style="width: 80%;">Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody style="border: none">
            <?php foreach ($members as $user) : ?>
                <tr>
                    <td>
                        <?php echo $user->username?>
                    </td>
                    <td>
                        <?php echo Html::button('<i class="fa fa-line-chart " aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.views_user_index', 'View EEG Data'), ['class' => 'btn btn-success', 'data-target' => '#myModal', 'data-toggle'=>"modal"]); ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
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
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


