<?php

use Yii;
use yii\helpers\Url;
use humhub\libs\Html;
use yii\helpers\ArrayHelper;
use \humhub\compat\CHtml;
use yii\jui\DatePicker;
use yii\widgets\ActiveForm;
use humhub\widgets\TimePicker;
use humhub\modules\user\models\Instructor;

use humhub\widgets\ModalButton;
use humhub\widgets\ModalDialog;


?>
<script src="http://bl.ocks.org/ndarville/raw/7075823/d3.min.js?v=3.2.8"> </script>
<link rel="stylesheet" type="text/css" href="protected/humhub/modules/session/views/eeg/multiline.css">
<script src="http://d3js.org/d3.v3.js" charset="utf-8"> </script>
<script src="protected/humhub/modules/session/views/eeg/multiline.js" charset="utf-8"></script>
<?php ModalDialog::begin(['header' => Yii::t('SessionModule.views_session_eeg', '<strong>EEG</strong> Data'), 'size' => 'large']) ?>


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
<?php ModalDialog::end(); ?>